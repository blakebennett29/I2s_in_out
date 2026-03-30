
//------------------------------------------------------------------------------
// (c) Copyright 2023 Advanced Micro Devices. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "L_L1_fir_compiler_1" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -0.0008087278,0.0000000000,0.0008591090,-0.0000000000,-0.0009620094,-0.0000000000,0.0011221986,-0.0000000000,-0.0013446239,0.0000000000,0.0016344578,0.0000000000,-0.0019971614,-0.0000000000,0.0024385686,-0.0000000000,-0.0029649978,0.0000000000,0.0035833979,-0.0000000000,-0.0043015409,-0.0000000000,0.0051282752,-0.0000000000,-0.0060738616,0.0000000000,0.0071504227,-0.0000000000,-0.0083725501,-0.0000000000,0.0097581352,-0.0000000000,-0.0113295242,0.0000000000,0.0131151535,-0.0000000000,-0.0151519117,-0.0000000000,0.0174886356,-0.0000000000,-0.0201914289,0.0000000000,0.0233520163,-0.0000000000,-0.0271013699,0.0000000000,0.0316329467,-0.0000000000,-0.0372445071,0.0000000000,0.0444185212,-0.0000000000,-0.0539902751,0.0000000000,0.0675400942,-0.0000000000,-0.0884579176,0.0000000000,0.1255628006,-0.0000000000,-0.2112003444,0.0000000000,0.6365089983,1.0003980404,0.6365089983,0.0000000000,-0.2112003444,-0.0000000000,0.1255628006,0.0000000000,-0.0884579176,-0.0000000000,0.0675400942,0.0000000000,-0.0539902751,-0.0000000000,0.0444185212,0.0000000000,-0.0372445071,-0.0000000000,0.0316329467,0.0000000000,-0.0271013699,-0.0000000000,0.0233520163,0.0000000000,-0.0201914289,-0.0000000000,0.0174886356,-0.0000000000,-0.0151519117,-0.0000000000,0.0131151535,0.0000000000,-0.0113295242,-0.0000000000,0.0097581352,-0.0000000000,-0.0083725501,-0.0000000000,0.0071504227,0.0000000000,-0.0060738616,-0.0000000000,0.0051282752,-0.0000000000,-0.0043015409,-0.0000000000,0.0035833979,0.0000000000,-0.0029649978,-0.0000000000,0.0024385686,-0.0000000000,-0.0019971614,0.0000000000,0.0016344578,0.0000000000,-0.0013446239,-0.0000000000,0.0011221986,-0.0000000000,-0.0009620094,-0.0000000000,0.0008591090,0.0000000000,-0.0008087278
// chanpats: 173
// name: L_L1_fir_compiler_1
// filter_type: 2
// rate_change: 0
// interp_rate: 1
// decim_rate: 2
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 127
// coeff_sets: 1
// reloadable: 0
// is_halfband: 1
// quantization: 1
// coeff_width: 24
// coeff_fract_width: 22
// chan_seq: 0
// num_channels: 2
// num_paths: 1
// data_width: 32
// data_fract_width: 0
// output_rounding_mode: 5
// output_width: 32
// output_fract_width: 0
// config_method: 0

const double L_L1_fir_compiler_1_coefficients[127] = {-0.0008087278,0.0000000000,0.0008591090,-0.0000000000,-0.0009620094,-0.0000000000,0.0011221986,-0.0000000000,-0.0013446239,0.0000000000,0.0016344578,0.0000000000,-0.0019971614,-0.0000000000,0.0024385686,-0.0000000000,-0.0029649978,0.0000000000,0.0035833979,-0.0000000000,-0.0043015409,-0.0000000000,0.0051282752,-0.0000000000,-0.0060738616,0.0000000000,0.0071504227,-0.0000000000,-0.0083725501,-0.0000000000,0.0097581352,-0.0000000000,-0.0113295242,0.0000000000,0.0131151535,-0.0000000000,-0.0151519117,-0.0000000000,0.0174886356,-0.0000000000,-0.0201914289,0.0000000000,0.0233520163,-0.0000000000,-0.0271013699,0.0000000000,0.0316329467,-0.0000000000,-0.0372445071,0.0000000000,0.0444185212,-0.0000000000,-0.0539902751,0.0000000000,0.0675400942,-0.0000000000,-0.0884579176,0.0000000000,0.1255628006,-0.0000000000,-0.2112003444,0.0000000000,0.6365089983,1.0003980404,0.6365089983,0.0000000000,-0.2112003444,-0.0000000000,0.1255628006,0.0000000000,-0.0884579176,-0.0000000000,0.0675400942,0.0000000000,-0.0539902751,-0.0000000000,0.0444185212,0.0000000000,-0.0372445071,-0.0000000000,0.0316329467,0.0000000000,-0.0271013699,-0.0000000000,0.0233520163,0.0000000000,-0.0201914289,-0.0000000000,0.0174886356,-0.0000000000,-0.0151519117,-0.0000000000,0.0131151535,0.0000000000,-0.0113295242,-0.0000000000,0.0097581352,-0.0000000000,-0.0083725501,-0.0000000000,0.0071504227,0.0000000000,-0.0060738616,-0.0000000000,0.0051282752,-0.0000000000,-0.0043015409,-0.0000000000,0.0035833979,0.0000000000,-0.0029649978,-0.0000000000,0.0024385686,-0.0000000000,-0.0019971614,0.0000000000,0.0016344578,0.0000000000,-0.0013446239,-0.0000000000,0.0011221986,-0.0000000000,-0.0009620094,-0.0000000000,0.0008591090,0.0000000000,-0.0008087278};

const xip_fir_v7_2_pattern L_L1_fir_compiler_1_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_L_L1_fir_compiler_1_config() {
  xip_fir_v7_2_config config;
  config.name                = "L_L1_fir_compiler_1";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 2;
  config.zero_pack_factor    = 1;
  config.coeff               = &L_L1_fir_compiler_1_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 127;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 1;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 24;
  config.coeff_fract_width   = 22;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 2;
  config.init_pattern        = L_L1_fir_compiler_1_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 32;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_CONVERGENT_ODD;
  config.output_width        = 32;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config L_L1_fir_compiler_1_config = gen_L_L1_fir_compiler_1_config();

