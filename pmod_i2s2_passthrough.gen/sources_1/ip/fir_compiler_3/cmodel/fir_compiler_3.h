
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
// C Model configuration for the "fir_compiler_3" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 1470,3171,-1351,-3554,1270,4156,-1193,-5006,1077,6125,-876,-7534,536,9246,0,-11269,-796,13607,1920,-16255,-3446,19204,5451,-22438,-8020,25935,11244,-29666,-15222,33599,20065,-37693,-25899,41907,32870,-46192,-41157,50498,50982,-54774,-62634,58964,76505,-63015,-93142,66874,113352,-70488,-138369,73807,170199,-76786,-212317,79383,271319,-81560,-361376,83287,519408,-84539,-880914,85297,2665824,4106465,2665824,85297,-880914,-84539,519408,83287,-361376,-81560,271319,79383,-212317,-76786,170199,73807,-138369,-70488,113352,66874,-93142,-63015,76505,58964,-62634,-54774,50982,50498,-41157,-46192,32870,41907,-25899,-37693,20065,33599,-15222,-29666,11244,25935,-8020,-22438,5451,19204,-3446,-16255,1920,13607,-796,-11269,0,9246,536,-7534,-876,6125,1077,-5006,-1193,4156,1270,-3554,-1351,3171,1470
// chanpats: 173
// name: fir_compiler_3
// filter_type: 1
// rate_change: 0
// interp_rate: 2
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 127
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 23
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 2
// num_paths: 1
// data_width: 32
// data_fract_width: 0
// output_rounding_mode: 5
// output_width: 32
// output_fract_width: 0
// config_method: 0

const double fir_compiler_3_coefficients[127] = {1470,3171,-1351,-3554,1270,4156,-1193,-5006,1077,6125,-876,-7534,536,9246,0,-11269,-796,13607,1920,-16255,-3446,19204,5451,-22438,-8020,25935,11244,-29666,-15222,33599,20065,-37693,-25899,41907,32870,-46192,-41157,50498,50982,-54774,-62634,58964,76505,-63015,-93142,66874,113352,-70488,-138369,73807,170199,-76786,-212317,79383,271319,-81560,-361376,83287,519408,-84539,-880914,85297,2665824,4106465,2665824,85297,-880914,-84539,519408,83287,-361376,-81560,271319,79383,-212317,-76786,170199,73807,-138369,-70488,113352,66874,-93142,-63015,76505,58964,-62634,-54774,50982,50498,-41157,-46192,32870,41907,-25899,-37693,20065,33599,-15222,-29666,11244,25935,-8020,-22438,5451,19204,-3446,-16255,1920,13607,-796,-11269,0,9246,536,-7534,-876,6125,1077,-5006,-1193,4156,1270,-3554,-1351,3171,1470};

const xip_fir_v7_2_pattern fir_compiler_3_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_compiler_3_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_compiler_3";
  config.filter_type         = 1;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 2;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_compiler_3_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 127;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 23;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 2;
  config.init_pattern        = fir_compiler_3_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 32;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_CONVERGENT_ODD;
  config.output_width        = 32;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_compiler_3_config = gen_fir_compiler_3_config();

