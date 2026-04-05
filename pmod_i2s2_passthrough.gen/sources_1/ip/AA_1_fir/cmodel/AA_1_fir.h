
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
// C Model configuration for the "AA_1_fir" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 2940,6342,-2702,-7108,2540,8312,-2386,-10012,2154,12250,-1752,-15068,1072,18492,0,-22538,-1592,27214,3840,-32510,-6892,38408,10902,-44876,-16040,51870,22488,-59332,-30444,67198,40130,-75386,-51798,83814,65740,-92384,-82314,100996,101964,-109548,-125268,117928,153010,-126030,-186284,133748,226704,-140976,-276738,147614,340398,-153572,-424634,158766,542638,-163120,-722752,166574,1038816,-169078,-1761828,170594,5331648,8212930,5331648,170594,-1761828,-169078,1038816,166574,-722752,-163120,542638,158766,-424634,-153572,340398,147614,-276738,-140976,226704,133748,-186284,-126030,153010,117928,-125268,-109548,101964,100996,-82314,-92384,65740,83814,-51798,-75386,40130,67198,-30444,-59332,22488,51870,-16040,-44876,10902,38408,-6892,-32510,3840,27214,-1592,-22538,0,18492,1072,-15068,-1752,12250,2154,-10012,-2386,8312,2540,-7108,-2702,6342,2940
// chanpats: 173
// name: AA_1_fir
// filter_type: 2
// rate_change: 0
// interp_rate: 1
// decim_rate: 2
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 127
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 24
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 2
// num_paths: 1
// data_width: 24
// data_fract_width: 0
// output_rounding_mode: 5
// output_width: 32
// output_fract_width: 0
// config_method: 0

const double AA_1_fir_coefficients[127] = {2940,6342,-2702,-7108,2540,8312,-2386,-10012,2154,12250,-1752,-15068,1072,18492,0,-22538,-1592,27214,3840,-32510,-6892,38408,10902,-44876,-16040,51870,22488,-59332,-30444,67198,40130,-75386,-51798,83814,65740,-92384,-82314,100996,101964,-109548,-125268,117928,153010,-126030,-186284,133748,226704,-140976,-276738,147614,340398,-153572,-424634,158766,542638,-163120,-722752,166574,1038816,-169078,-1761828,170594,5331648,8212930,5331648,170594,-1761828,-169078,1038816,166574,-722752,-163120,542638,158766,-424634,-153572,340398,147614,-276738,-140976,226704,133748,-186284,-126030,153010,117928,-125268,-109548,101964,100996,-82314,-92384,65740,83814,-51798,-75386,40130,67198,-30444,-59332,22488,51870,-16040,-44876,10902,38408,-6892,-32510,3840,27214,-1592,-22538,0,18492,1072,-15068,-1752,12250,2154,-10012,-2386,8312,2540,-7108,-2702,6342,2940};

const xip_fir_v7_2_pattern AA_1_fir_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_AA_1_fir_config() {
  xip_fir_v7_2_config config;
  config.name                = "AA_1_fir";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 2;
  config.zero_pack_factor    = 1;
  config.coeff               = &AA_1_fir_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 127;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 24;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 2;
  config.init_pattern        = AA_1_fir_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 24;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_CONVERGENT_ODD;
  config.output_width        = 32;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config AA_1_fir_config = gen_AA_1_fir_config();

