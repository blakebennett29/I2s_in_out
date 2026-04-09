
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
// C Model configuration for the "H_L1_fir_compiler_2" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -0.0004043639,-0.0000000000,0.0004295545,0.0000000000,-0.0004810047,0.0000000000,0.0005610993,0.0000000000,-0.0006723119,-0.0000000000,0.0008172289,-0.0000000000,-0.0009985807,0.0000000000,0.0012192843,0.0000000000,-0.0014824989,-0.0000000000,0.0017916990,0.0000000000,-0.0021507705,0.0000000000,0.0025641376,0.0000000000,-0.0030369308,-0.0000000000,0.0035752114,0.0000000000,-0.0041862751,0.0000000000,0.0048790676,0.0000000000,-0.0056647621,-0.0000000000,0.0065575767,0.0000000000,-0.0075759558,0.0000000000,0.0087443178,0.0000000000,-0.0100957145,-0.0000000000,0.0116760082,0.0000000000,-0.0135506850,-0.0000000000,0.0158164734,0.0000000000,-0.0186222535,-0.0000000000,0.0222092606,0.0000000000,-0.0269951375,-0.0000000000,0.0337700471,0.0000000000,-0.0442289588,-0.0000000000,0.0627814003,0.0000000000,-0.1056001722,-0.0000000000,0.3182544992,-0.5001990202,0.3182544992,-0.0000000000,-0.1056001722,0.0000000000,0.0627814003,-0.0000000000,-0.0442289588,0.0000000000,0.0337700471,-0.0000000000,-0.0269951375,0.0000000000,0.0222092606,-0.0000000000,-0.0186222535,0.0000000000,0.0158164734,-0.0000000000,-0.0135506850,0.0000000000,0.0116760082,-0.0000000000,-0.0100957145,0.0000000000,0.0087443178,0.0000000000,-0.0075759558,0.0000000000,0.0065575767,-0.0000000000,-0.0056647621,0.0000000000,0.0048790676,0.0000000000,-0.0041862751,0.0000000000,0.0035752114,-0.0000000000,-0.0030369308,0.0000000000,0.0025641376,0.0000000000,-0.0021507705,0.0000000000,0.0017916990,-0.0000000000,-0.0014824989,0.0000000000,0.0012192843,0.0000000000,-0.0009985807,-0.0000000000,0.0008172289,-0.0000000000,-0.0006723119,0.0000000000,0.0005610993,0.0000000000,-0.0004810047,0.0000000000,0.0004295545,-0.0000000000,-0.0004043639
// chanpats: 173
// name: H_L1_fir_compiler_2
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
// coeff_fract_width: 23
// chan_seq: 0
// num_channels: 2
// num_paths: 1
// data_width: 32
// data_fract_width: 0
// output_rounding_mode: 5
// output_width: 32
// output_fract_width: 0
// config_method: 0

const double H_L1_fir_compiler_2_coefficients[127] = {-0.0004043639,-0.0000000000,0.0004295545,0.0000000000,-0.0004810047,0.0000000000,0.0005610993,0.0000000000,-0.0006723119,-0.0000000000,0.0008172289,-0.0000000000,-0.0009985807,0.0000000000,0.0012192843,0.0000000000,-0.0014824989,-0.0000000000,0.0017916990,0.0000000000,-0.0021507705,0.0000000000,0.0025641376,0.0000000000,-0.0030369308,-0.0000000000,0.0035752114,0.0000000000,-0.0041862751,0.0000000000,0.0048790676,0.0000000000,-0.0056647621,-0.0000000000,0.0065575767,0.0000000000,-0.0075759558,0.0000000000,0.0087443178,0.0000000000,-0.0100957145,-0.0000000000,0.0116760082,0.0000000000,-0.0135506850,-0.0000000000,0.0158164734,0.0000000000,-0.0186222535,-0.0000000000,0.0222092606,0.0000000000,-0.0269951375,-0.0000000000,0.0337700471,0.0000000000,-0.0442289588,-0.0000000000,0.0627814003,0.0000000000,-0.1056001722,-0.0000000000,0.3182544992,-0.5001990202,0.3182544992,-0.0000000000,-0.1056001722,0.0000000000,0.0627814003,-0.0000000000,-0.0442289588,0.0000000000,0.0337700471,-0.0000000000,-0.0269951375,0.0000000000,0.0222092606,-0.0000000000,-0.0186222535,0.0000000000,0.0158164734,-0.0000000000,-0.0135506850,0.0000000000,0.0116760082,-0.0000000000,-0.0100957145,0.0000000000,0.0087443178,0.0000000000,-0.0075759558,0.0000000000,0.0065575767,-0.0000000000,-0.0056647621,0.0000000000,0.0048790676,0.0000000000,-0.0041862751,0.0000000000,0.0035752114,-0.0000000000,-0.0030369308,0.0000000000,0.0025641376,0.0000000000,-0.0021507705,0.0000000000,0.0017916990,-0.0000000000,-0.0014824989,0.0000000000,0.0012192843,0.0000000000,-0.0009985807,-0.0000000000,0.0008172289,-0.0000000000,-0.0006723119,0.0000000000,0.0005610993,0.0000000000,-0.0004810047,0.0000000000,0.0004295545,-0.0000000000,-0.0004043639};

const xip_fir_v7_2_pattern H_L1_fir_compiler_2_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_H_L1_fir_compiler_2_config() {
  xip_fir_v7_2_config config;
  config.name                = "H_L1_fir_compiler_2";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 2;
  config.zero_pack_factor    = 1;
  config.coeff               = &H_L1_fir_compiler_2_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 127;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 1;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 24;
  config.coeff_fract_width   = 23;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 2;
  config.init_pattern        = H_L1_fir_compiler_2_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 32;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_CONVERGENT_ODD;
  config.output_width        = 32;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config H_L1_fir_compiler_2_config = gen_H_L1_fir_compiler_2_config();

