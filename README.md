# FPGA Audio Multiband Processor

## Overview

This project implements a real-time digital audio processing chain on an FPGA using an **I2S audio interface**, **multirate FIR filtering**, and 2 **multiband signal paths**. The system receives stereo digital audio from the **ADC** on our board; those samples get processed on the FPGA and are transmitted back out over I2S.

The current design targets a Xilinx Artix-7 based development flow and was developed in **Vivado** using a mix of custom **VHDL** and Xilinx FIR Compiler IP cores.

At a high level, the project demonstrates:

* Real-time **I2S input and output** handling
* **Oversampled audio processing**
* **Anti-aliasing filtering** with 48 kHz and 24 kHz cutoff stages before rate changes
* **QMF (Quadrature Mirror Filter)** band splitting with FIR filters
* A practical FPGA-oriented filter-bank architecture
* Resource/performance tradeoffs for scaling to more bands

---
System Block Diagram

![System block diagram](docs/Block_Diagram.png)


Figure: Current multirate multiband signal path, showing I2S input, anti-alias filtering, decimation, QMF splits, modulation/envelope stages, interpolation, reconstruction filtering, and I2S output.

## System Goal

The goal of this project is to build a flexible FPGA-based audio platform that splits incoming audio into frequency bands, processes those bands independently, and then reconstructs the signal for playback.

This playback signal path (1) will be modulated by another input signal (2). Signal input (2) will be a modulator for signal input (1). Meaning the gain and frequency pass-through will be determined by input (2), where the audio will be modulated and passed through from input (1).

This creates a foundation for features such as:

* Multiband dynamics processing
* Band-specific effects
* Adaptive spectral processing
* Audio analysis and control systems
* Future DSP experimentation in hardware

---

<!-- Add better board photo later 

<h1>Hardware Box and Circuit Board</h1>

<h1>Hardware Overview</h1>

<table cellspacing="20">
  <tr>
    <td align="center">
      <img src="docs/Board_in_Box.jpg" alt="Hardware Box" width="500"><br>
      <b>Hardware Box</b>
    </td>
    <td align="center">
      <img src="docs/Curcit_Board.jpg" alt="Circuit Board" width="500"><br>
      <b>Circuit Board</b>
    </td>
  </tr>
</table>

-->

## Hardware Platform

This design is built around:

* **Basys 3 / Artix-7 FPGA platform**
* Digilent Pmod I2S2 audio interface for initial testing
* Up-clocking using PLLs to get from 24.576 MHz to 98.8 MHz
* External audio codec path for stereo input/output
* FPGA clocking for audio-domain timing and internal compute timing

The audio interface uses **I2S**, where stereo audio samples are transferred using:

* **BCLK / SCLK** for bit timing
* **LRCLK / WS** for left-right channel framing
* **SDIN / SDOUT** for serial audio data

The project uses **24-bit audio samples carried in 32-bit slots**, which is a common and practical format for I2S audio transport.
We used left-justified testing with the PMOD, but the Philips protocol was used with the integration with the board because of the ADC and DAC protocols.

---

## How the Project Works

## 1. I2S Receive

The FPGA first captures incoming stereo audio from the codec through a custom I2S receiver.

The receiver:

* Detects left and right channel boundaries from **LRCLK**
* Shifts in serial data using the I2S timing convention
* Reconstructs each audio word into parallel sample data
* Separates left and right channels for internal processing

Because I2S is serial, one of the most important parts of the design is correct **bit alignment** and **word timing**. The design follows the standard I2S convention, where the data is delayed by one bit clock relative to the LRCLK transition. This is consistent with the Philips protocol.


## Filter Design Method

The FIR filters used in this project were generated with a Python script that builds lowpass anti-alias filters and split-band filters, then quantizes the coefficients into **Q1.23 fixed-point** and writes them to `.coe` files for Vivado FIR Compiler use. The script sets the main design choices up front: the number of taps, the window type, the radix for `.coe` output, the sample-rate tree, and the cutoff frequencies for each stage.

In this version, the design starts at **192 kHz**, then steps down to **96 kHz** and **48 kHz**, with cutoff targets of **48 kHz**, **24 kHz**, and a **12 kHz split** for the low/high bands.

### 1. Filter specifications

The script first defines the sample-rate tree and the cutoff frequencies for each stage. That means each filter is designed in the sample-rate domain where it will actually operate:

- **192 kHz to 96 kHz anti-alias filter** with `fc = 48 kHz`
- **96 kHz to 48 kHz anti-alias filter** with `fc = 24 kHz`
- **48 kHz split filter** with `fc = 12 kHz`

This is important because the normalized cutoff depends on the local sample rate, not just the absolute frequency. In the Python code, that normalized cutoff is computed as:

`fc_norm = fc / fs`

So the same FIR design function can be reused at each stage just by changing `fs` and `fc`.

### 2. Ideal lowpass equation

The lowpass filter is built from the ideal sinc-form FIR equation. In the code, the ideal impulse response is:

`h_ideal = 2.0 * fc_norm * np.sinc(2.0 * fc_norm * (n - m))`

where:

- `n` is the tap index
- `m = (num_taps - 1) / 2` is the center tap location
- `fc_norm = fc / fs` is the normalized cutoff frequency

This is the standard finite-length form of the ideal lowpass impulse response:

`h_ideal[n] = 2 f_c(norm) * sinc(2 f_c(norm) * (n - m))`

The sinc equation creates the desired lowpass behavior in frequency, and centering it at `m` makes the filter symmetric. That symmetry gives a **linear-phase FIR**, which is useful here because it preserves waveform shape aside from delay. Since the design uses `127` taps, the center tap is:

`m = (127 - 1) / 2 = 63`

So the impulse response is symmetric around tap 63.

### 3. Why taps matter

A **tap** is one coefficient in the FIR filter. If a filter has 127 taps, it means the output sample is formed from 127 delayed input samples multiplied by 127 coefficients and summed together.

More taps generally mean:

- a narrower transition band
- better stopband rejection
- higher hardware cost
- more latency

So in this project, `127` taps is the tradeoff point chosen between frequency selectivity and FPGA resource usage. The script uses the same tap count across the anti-alias and split filters so the system stays more consistent and easier to compare.

### 4. Windowing and why it is needed

An ideal sinc lowpass is infinitely long, but real FIR filters must have a finite number of taps. Truncating the sinc directly causes ripple and unwanted frequency artifacts. To reduce those effects, the script multiplies the ideal impulse response by a window:

`h = h_ideal * window_fn(window, num_taps)`

The available windows in the script are:

- `hamming`
- `hann`
- `blackman`
- `rect`

A rectangular window is just raw truncation. Hamming, Hann, and Blackman taper the sinc toward zero at the ends, which reduces sidelobes and improves stopband behavior at the cost of a wider transition band. In this script, the selected window is `hamming`, so each ideal sinc response is shaped by a Hamming window before normalization.

### 5. How the window translates to taps

The window does not change the number of taps. Instead, it changes the values of those taps.

So the process is:

1. Choose the tap count, here `127`
2. Compute the 127 ideal sinc samples
3. Compute 127 window values
4. Multiply them point-by-point

That means each final coefficient is:

`h[n] = h_ideal[n] * w[n]`

where `w[n]` is the chosen window. The result is still a 127-tap FIR, but now the outer taps are softened by the window shape instead of ending abruptly. This improves practical filter behavior and is one of the most important steps in real FIR design.

### 6. Gain normalization

After windowing, the script normalizes the filter so the DC gain is 1 and then optionally applies extra gain:

`h /= np.sum(h)`

`h *= gain`

For a lowpass filter, dividing by the sum of the coefficients forces the gain at DC to be 1. After that, the script can optionally scale the filter by `gain = 2.0` for versions where extra passband gain is desired.

This is why the script generates both `g1` and `g2` versions of the filters:

- `g1` = unity-gain version
- `g2` = 2x-gain version

### 7. Creating the high-pass split from the low-pass design

For the 12 kHz split at `fs = 48 kHz`, the Python code first designs a lowpass split filter and then creates the complementary high-pass branch using spectral shifting:

`h_high[n] = h_low[n] * (-1)^n`

This moves the spectrum of the lowpass prototype to the high-frequency side, producing the high-band branch from the same base design.

That is why the code generates both low-pass and high-pass split filters from one prototype. This is a practical way to create matched low/high split filters.

### 8. Fixed-point conversion to Q1.23

Once the floating-point filter is designed, the script converts it to **Q1.23**, which means:

- 1 sign/integer bit region
- 23 fractional bits
- total signed 24-bit coefficient storage

The scaling constant is:

`Q_SCALE = 2 ** 23`

The script checks coefficient headroom, applies a safety scale if needed, rounds the values, and clips them to the valid Q1.23 integer range. This step is what converts the mathematically designed filter into something the FPGA FIR core can actually store and use. It also protects against coefficient overflow if a gain-scaled version would otherwise exceed the allowed range.

### 9. Writing the `.coe` file

After quantization, the script writes the coefficients into Vivado-compatible `.coe` format using the selected radix. For hexadecimal output it converts signed values into 24-bit two’s complement form. This makes the output directly usable for FIR Compiler coefficient loading.

### 10. Plotting and verification

For each filter, the script also plots:

- the floating-point coefficients
- the quantized Q1.23 coefficients
- the frequency response in dB
- a vertical marker at the intended cutoff

The frequency response is computed with an FFT, which allows the designed filter to be checked before exporting it to hardware. The comparison between float and Q1.23 versions is especially useful for seeing whether quantization changed the response in any meaningful way.

### 11. Filters generated by the script

The script produces three main groups of filters:

1. **Anti-alias filter for 192 kHz to 96 kHz**
2. **Anti-alias filter for 96 kHz to 48 kHz**
3. **12 kHz low/high split filters at 48 kHz**

For each of these, it generates both unity-gain and 2x-gain versions. This matches the multirate structure used in the project: anti-alias before decimation, then complementary split filters at the lower-rate stage.

### 12. How to change the transition band for a better noise floor with the same number of taps

If the goal is to get a **less aggressive cutoff** and a **cleaner practical noise floor** while keeping the same `127` taps, the main change is to **widen the transition band** instead of trying to hold such a sharp edge.

With a fixed tap count, a very sharp transition forces the filter to spend more of its available degrees of freedom on edge sharpness. That usually means:

- more ripple near the band edge
- worse stopband behavior away from the cutoff
- more ringing in time domain
- a harsher-looking floor in the plotted response

To make the filter easier on the same hardware budget, I would change two things:

#### A. Move the cutoff farther away from Nyquist

For example, instead of designing right up near the folding boundary, move the cutoff down slightly so the filter has more room to roll off.

That means using a lower `fc` such as:

- slightly below `48 kHz` for the 192 kHz to 96 kHz stage
- slightly below `24 kHz` for the 96 kHz to 48 kHz stage
- slightly below `12 kHz` for the 48 kHz split

Doing this widens the transition region without increasing the number of taps. The result is usually lower sidelobes and smoother attenuation behavior.

#### B. Use a stronger window if stopband floor matters more than edge sharpness

If the current Hamming window is not giving enough stopband suppression, I would try **Blackman** first. Blackman gives a wider transition band than Hamming, but usually improves sidelobe suppression. That can make the effective stopband floor look cleaner, which is often what people mean when they want a better noise floor from the filter.

So the change would be:

- keep `NUM_TAPS = 127`
- change `WINDOW = "hamming"` to `WINDOW = "blackman"`
- reduce `fc` slightly to give more transition room

#### Why this works

With the same number of taps, you cannot usually get all three of these at once:

- very sharp cutoff
- very low stopband floor
- low ripple

So if you want a better floor, the normal trade is to accept a broader transition. That is the cleaner design choice than forcing the edge to stay too sharp.

#### Practical example

For the split filter at `fs = 48 kHz`, instead of targeting exactly `12 kHz` with an aggressive edge, you could design the lowpass to begin rolling off earlier, such as around `10.5 to 11.5 kHz`, depending on how much overlap you want. That gives the filter more room to decay before Nyquist-related constraints become dominant.

For the AA stages, the same idea applies: do not place the effective passband edge right up against the decimation boundary if the same tap count must be preserved.

#### Summary of the change

To get a better noise floor and a less aggressive cutoff with the same number of taps:

1. lower the cutoff slightly
2. widen the transition band
3. switch from Hamming to Blackman if stopband suppression matters more than transition sharpness
4. accept a softer crossover edge in exchange for cleaner rejection

That is the most realistic improvement path without increasing filter length.

### Summary

The filter design flow is:

1. Choose the operating sample rate and cutoff
2. Choose the number of taps
3. Build the ideal sinc lowpass equation
4. Apply a window to make the FIR finite and practical
5. Normalize the gain
6. Derive the high-pass split where needed using spectral shifting
7. Check Q1.23 headroom
8. Quantize to 24-bit fixed-point
9. Export to `.coe`
10. Plot and verify the response

This makes the Python script the bridge between DSP theory and FPGA implementation: it defines the filter mathematically, shapes it with a window, translates that design into a fixed number of taps, and then converts those taps into a hardware-ready coefficient file.





## 2. Internal Processing Path

Once samples are captured, they are routed through a multirate DSP chain made from FIR filters.

The present layout is based on:

1. **2 anti-alias filters**
2. **Downsampling / decimation**
3. **Band splitting**
4. Optional per-band processing
5. **Interpolation / upsampling**
6. Final anti-imaging filtering (reconstruction with AA filters)
7. I2S transmit back to the codec

This structure is efficient because lower-frequency bands can be processed at lower sample rates, reducing the number of operations required per second.
This would be a big part of Rev. 2 of this project, having it take the full computation time to allocate samples rather than running everything in parallel and not taking advantage of the extra time.

## 3. I2S Transmit

After processing, the samples are reformatted into the outgoing I2S stream and shifted back out to the codec.

The transmitter:

* Loads left and right sample words into output shift registers
* Aligns those words to the outgoing I2S frame timing
* Shifts the processed data out bit-by-bit
* Preserves stereo channel order and word timing

---

## Multirate Processing Strategy

A major strength of this design is that it does **not** process every band at the full original sample rate unless necessary.

Instead, the system uses **multirate DSP**, which means:

* Before reducing the sample rate, a lowpass **anti-alias filter** is applied
* Once the sample rate is reduced, lower-frequency content can be processed more cheaply
* Before reconstructing the signal, interpolation and output filtering restore the sample stream

This is one of the most important ideas in the project because it makes a hardware implementation much more realistic than trying to run every filter at the highest rate all the time.

---

## Aliasing Condition, Why It Is Being Relaxed, and Why It Is Acceptable

Aliasing occurs when signal content above the new Nyquist limit folds back into lower frequencies during downsampling.

For example, if the sample rate is reduced by 2, the new Nyquist frequency is also cut in half. Any energy above that new limit should ideally be removed before decimation, or it will fold into the passband and corrupt the result.

In an ideal multirate system, the aliasing condition is satisfied strictly before every decimation stage. In this project, the base split does **not fully satisfy that condition in the strict textbook sense**. There is still some spectral overlap around the crossover region when the signal is decimated.

So the most accurate way to describe the design is:

> the architecture allows some aliasing risk at the base filter layer, but the practical impact is limited by aggressive cutoff placement, strong overlap behavior, and the way the bands are reconstructed.

### Why this is acceptable in practice

Even though the alias condition is not being enforced perfectly at that stage, it is still acceptable for this design because:

* the crossover filters are intentionally aggressive
* the overlap region is narrow and controlled
* most of the energy that could fold is already strongly attenuated
* the remaining folded components are small enough to be tolerable in the intended application

So this is not a claim that aliasing is mathematically absent. It is a design tradeoff:

* strict alias-free splitting would require more filtering cost
* the present design accepts a controlled amount of alias interaction
* the audible and practical penalty is small enough to justify the hardware savings

That distinction is important. The system is not perfectly alias-free at that split. Instead, it is **engineered so that the amount of aliasing introduced is limited enough that it does not become a major problem**.

### Why the aggressive overlap helps

Because the crossover region is shaped aggressively, the band edges do not hand off abruptly. Instead, the filters overlap in a way that reduces the strength of unwanted edge artifacts. This means that even if the strict alias criterion is relaxed, the energy near the folding region is already reduced enough that the reconstructed result remains usable.

This is really a practical FPGA DSP compromise:

* not fully ideal in theory
* acceptable in implementation
* much cheaper than forcing a perfectly clean split everywhere

---

## Oversampling and Why It Helps

Oversampling is the main way to mitigate this issue more cleanly.

Rather than forcing extremely sharp filters at the first split stage, a better approach is to **oversample or keep a higher sample rate at the base filter layer**. Doing that creates more frequency space between the audio band of interest and the folding boundary.

### 1. More room for filter transition bands

When the sample rate is higher, the usable signal band occupies a smaller fraction of the total Nyquist range. That gives more room to design practical FIR filters with cleaner transitions.

### 2. Easier control of aliasing and imaging

With more spectral room, anti-alias and reconstruction filters do not need to be unrealistically sharp. That reduces implementation difficulty.

### 3. Better hardware tradeoffs

A well-planned oversampled chain can move demanding filtering stages into places where the filter requirements are easier to satisfy.

### 4. Cleaner multiband splitting

If the system is operating with margin above the final audio bandwidth of interest, the split bands can be designed with less overlap error and less risk of unwanted folding artifacts.

### Practical interpretation

The current design uses aggressive filtering and overlap to keep the aliasing penalty small enough to tolerate. A stronger next step would be to oversample at the base filter layer so that the same split can be achieved with more spectral margin and less folding risk.

That gives a useful progression:

1. Current system: acceptable practical tradeoff, but not strictly alias-free at the base split
2. Improved system: oversample the base filter layer to reduce the aliasing burden
3. Future system: combine oversampling with more efficient filter reuse or selective band splitting

In other words, **oversampling is the cleaner mitigation path**, especially at the earliest split where the alias condition is hardest to satisfy with limited hardware.

---

## Current Filter-Bank Layout

The current layout is effective for a smaller number of bands, but scaling it directly to **4 full bands across the entire spectrum** becomes expensive.

Why?

Because each additional full-range split typically requires:

* More FIR filters
* More adders and multipliers
* More routing
* More buffering and control logic
* More interpolation and decimation stages for reconstruction
* More timing pressure at higher clock rates

On an FPGA, this quickly increases usage of:

* DSP slices
* LUTs
* Registers
* BRAM
* Routing resources

It also makes timing closure harder and raises the risk of design complexity overwhelming the benefit.

---

## Why 4 Full Bands Is Too Much in the Current Layout

A straightforward 4-band implementation based on the current architecture would likely duplicate too much of the processing chain.

That means:

* Too many FIR instances active at once
* Too much parallel hardware
* Too much reconstruction overhead
* More complexity in managing latency matching between branches
* More opportunities for gain mismatch or boundary artifacts at crossover points

Even if the design fits, it may not be the best engineering choice because the added cost may not produce enough audible or functional benefit.

This is especially true when the lower bands are the ones that benefit most from narrow-band processing, while the upper bands often do not need the same level of subdivision.

---

## A Better Scaling Approach: Only Split the Low Bands

A more practical improvement is to **split only the low-frequency portion further**, instead of subdividing the entire spectrum uniformly.

This is a much better match for both signal behavior and hardware cost.

### Why this works

Low-frequency bands:

* Often need finer control
* Can be processed at lower sample rates after decimation
* Usually contain information where narrower band separation is more useful

High-frequency bands:

* Occupy a wider spectral region
* Often tolerate coarser grouping
* Are more expensive to split repeatedly because they stay at higher effective sample rates

### Suggested improvement

Instead of building four equal-style full-spectrum branches, a better structure is:

* First split the signal into **low** and **high**
* Keep the **high** branch as a single band
* Split the **low** branch again using a **QMF-style** or similar complementary filter pair
* Optionally continue only where the sample rate and band limits make the added hardware worth it

This gives a more practical multiband tree such as:

* Low-low
* Low-high
* High

or, with one more selective split:

* Sub-bass / low
* low-mid
* upper-mid / high

without forcing the entire spectrum through a full 4-way expansion.

---

## Why QMF-Based Low-Band Splitting Is Attractive

Using a **quadrature mirror filter (QMF)** or complementary low/high FIR pair for the low-frequency region is attractive because:

* The low band is already at a reduced sample rate
* FIR cost is lower at that point
* Complementary filters can reconstruct more cleanly
* You avoid paying the full hardware cost across the entire original bandwidth

This approach preserves most of the practical benefit of “more bands” while avoiding the worst resource growth.

It is a good compromise between:

* spectral control,
* reconstruction quality,
* and FPGA resource usage.

---

## Multiplexing to Improve Resource Usage

Another important path for improvement is **time multiplexing**.

Right now, the most direct implementation style is to dedicate hardware resources to each processing path in parallel. That is simple conceptually, but expensive.

A more efficient option is to reuse filter hardware across multiple channels or bands over time.

### Time-multiplexed idea

Instead of instantiating a separate FIR core for every branch, the FPGA can:

* store intermediate samples in buffers
* schedule different channels or bands into the same filter engine
* reuse multipliers and adders across multiple operations

### Why this helps

Multiplexing can reduce:

* DSP slice usage
* LUT usage
* BRAM duplication
* total instantiated IP count

This works especially well when:

* the system clock is much faster than the audio sample rate
* there is idle compute time between arriving samples
* latency constraints are moderate

### Tradeoff

The tradeoff is added control complexity:

* more scheduling logic
* buffer management
* stricter latency accounting
* potentially more complicated verification

But in a design like this, where audio sample rates are much lower than the FPGA compute clock, multiplexing can be a very strong optimization strategy.

---

## Why Multiplexing Makes Sense for This Project

This project already separates the audio-rate domain from the faster internal compute domain. That means there is an opportunity to do more work per incoming sample period than a purely sample-synchronous design would allow.

In practice, that means one well-designed processing block may be able to handle:

* left and right channels in sequence
* multiple band paths in sequence
* multiple filter stages in sequence

instead of duplicating all of them in hardware.

This is one of the most realistic ways to push toward more advanced band structures without immediately exhausting FPGA resources.

---

## Reconstruction Considerations

A multiband system is only useful if it reconstructs cleanly.

Key reconstruction concerns include:

* matched gain between branches
* complementary crossover behavior
* phase consistency
* equalized latency between paths
* proper interpolation and output filtering

If the filters are not complementary, the recombined signal can show:

* dips at crossover frequencies
* peaks at crossover frequencies
* phase cancellation
* summed gain errors

So a good multiband architecture is not just about splitting. It must also be designed so the branches add back together correctly.

---

## Practical Engineering Notes

Some important practical points for this project:

### Sample format

The design uses **24-bit audio carried in 32-bit words**, so care must be taken with:

* sign extension
* bit alignment
* truncation vs rounding
* gain staging between internal widths and output widths

### Clock-domain planning

Because the design uses audio clocks and a faster internal processing clock, reliable reset and signal handoff behavior matter. Good synchronization and deterministic framing are important.

### Fixed-point management

Every added band and every resampling stage increases the need for careful fixed-point scaling. Internal widths should be chosen to avoid unnecessary clipping while still keeping resource use reasonable.

### Latency accounting

Each FIR stage adds delay. A deeper multiband tree means the branches may no longer line up automatically. Delay matching is required before summation.

---

## Current Design Value

Even before expanding to more bands, the current design already demonstrates several important FPGA DSP concepts:

* serial audio interfacing with I2S
* real-time streaming dataflow
* FIR-based anti-alias and reconstruction filtering
* sample-rate conversion
* complementary band splitting
* hardware-conscious DSP architecture decisions

That makes the project valuable not just as an audio effect path, but also as a strong demonstration of practical digital signal processing on FPGA hardware.

---

## Future Improvements

Possible next steps include:

* Add per-band gain or dynamics control
* Implement time-multiplexed FIR processing
* Refine complementary crossover filter design
* Split only the low-frequency branch for improved resource efficiency
* Add cleaner latency compensation between branches
* Improve coefficient quantization and rounding strategy
* Add measurement workflows for crossover sum-flatness and phase matching
* Explore reusable filter-bank scheduling instead of fully parallel expansion

---

## Recommended Direction

The best next architectural improvement is likely:

1. Keep the current 2-band structure stable
2. Verify clean reconstruction and gain consistency
3. Add a second split only on the low-frequency branch
4. Use complementary FIR or QMF-based filters for that added split
5. Investigate time-multiplexing to reduce hardware duplication

This approach gives a meaningful step toward a richer multiband processor without committing to a costly full 4-band expansion across the entire spectrum.

---

## Conclusion

This project shows how a real-time FPGA audio system can combine I2S interfacing, oversampling, multirate FIR processing, and multiband signal decomposition in a practical hardware design.

The current system does not strictly satisfy the alias-free condition at the base split, but the design uses aggressive cutoff placement, controlled overlap, and practical reconstruction behavior to keep the penalty small enough to tolerate. Oversampling provides additional design margin that makes filtering and reconstruction more practical, and it is the clearest next step for reducing this alias burden. While a direct 4-band expansion of the current layout is too expensive in resources, there are realistic ways to scale the design, especially by splitting only the low bands further and by reusing processing hardware through multiplexing.

That makes the project a strong foundation for future FPGA-based audio DSP work.


---

## Author

Senior FPGA audio processing project focused on real-time I2S streaming, multirate FIR filtering, and efficient multiband architecture design.
