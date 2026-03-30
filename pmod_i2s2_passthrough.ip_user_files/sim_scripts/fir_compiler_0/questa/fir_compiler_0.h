
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
// C Model configuration for the "fir_compiler_0" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 0.0003091861,0.0007986677,-0.0001120273,-0.0009028220,-0.0001254454,0.0009984131,0.0004290296,-0.0010601225,-0.0008177600,0.0010460532,0.0012954429,-0.0009022957,-0.0018433441,0.0005708255,0.0024153577,-0.0000000000,-0.0029367762,-0.0008435090,0.0033074119,0.0019628300,-0.0034093267,-0.0033206895,0.0031188634,0.0048324894,-0.0023221082,-0.0063640198,0.0009324108,0.0077347404,0.0010917755,-0.0087269943,-0.0037306491,0.0091008657,0.0068902774,-0.0086137205,-0.0103948431,0.0070428619,0.0139849425,-0.0042092560,-0.0173221743,0.0000000000,0.0199992417,0.0056128419,-0.0215534918,-0.0125592069,0.0214800756,0.0206655333,-0.0192382111,-0.0296578698,0.0142390101,0.0391738855,-0.0057921483,-0.0487832140,-0.0070402992,0.0580147359,0.0258213670,-0.0663886828,-0.0537974570,0.0734509141,0.0995188976,-0.0788064296,-0.1949341263,0.0821491800,0.6304505410,0.9161407044,0.6304505410,0.0821491800,-0.1949341263,-0.0788064296,0.0995188976,0.0734509141,-0.0537974570,-0.0663886828,0.0258213670,0.0580147359,-0.0070402992,-0.0487832140,-0.0057921483,0.0391738855,0.0142390101,-0.0296578698,-0.0192382111,0.0206655333,0.0214800756,-0.0125592069,-0.0215534918,0.0056128419,0.0199992417,0.0000000000,-0.0173221743,-0.0042092560,0.0139849425,0.0070428619,-0.0103948431,-0.0086137205,0.0068902774,0.0091008657,-0.0037306491,-0.0087269943,0.0010917755,0.0077347404,0.0009324108,-0.0063640198,-0.0023221082,0.0048324894,0.0031188634,-0.0033206895,-0.0034093267,0.0019628300,0.0033074119,-0.0008435090,-0.0029367762,-0.0000000000,0.0024153577,0.0005708255,-0.0018433441,-0.0009022957,0.0012954429,0.0010460532,-0.0008177600,-0.0010601225,0.0004290296,0.0009984131,-0.0001254454,-0.0009028220,-0.0001120273,0.0007986677,0.0003091861
// chanpats: 173
// name: fir_compiler_0
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
// quantization: 1
// coeff_width: 24
// coeff_fract_width: 23
// chan_seq: 0
// num_channels: 2
// num_paths: 1
// data_width: 24
// data_fract_width: 0
// output_rounding_mode: 5
// output_width: 32
// output_fract_width: 5
// config_method: 0

const double fir_compiler_0_coefficients[127] = {0.0003091861,0.0007986677,-0.0001120273,-0.0009028220,-0.0001254454,0.0009984131,0.0004290296,-0.0010601225,-0.0008177600,0.0010460532,0.0012954429,-0.0009022957,-0.0018433441,0.0005708255,0.0024153577,-0.0000000000,-0.0029367762,-0.0008435090,0.0033074119,0.0019628300,-0.0034093267,-0.0033206895,0.0031188634,0.0048324894,-0.0023221082,-0.0063640198,0.0009324108,0.0077347404,0.0010917755,-0.0087269943,-0.0037306491,0.0091008657,0.0068902774,-0.0086137205,-0.0103948431,0.0070428619,0.0139849425,-0.0042092560,-0.0173221743,0.0000000000,0.0199992417,0.0056128419,-0.0215534918,-0.0125592069,0.0214800756,0.0206655333,-0.0192382111,-0.0296578698,0.0142390101,0.0391738855,-0.0057921483,-0.0487832140,-0.0070402992,0.0580147359,0.0258213670,-0.0663886828,-0.0537974570,0.0734509141,0.0995188976,-0.0788064296,-0.1949341263,0.0821491800,0.6304505410,0.9161407044,0.6304505410,0.0821491800,-0.1949341263,-0.0788064296,0.0995188976,0.0734509141,-0.0537974570,-0.0663886828,0.0258213670,0.0580147359,-0.0070402992,-0.0487832140,-0.0057921483,0.0391738855,0.0142390101,-0.0296578698,-0.0192382111,0.0206655333,0.0214800756,-0.0125592069,-0.0215534918,0.0056128419,0.0199992417,0.0000000000,-0.0173221743,-0.0042092560,0.0139849425,0.0070428619,-0.0103948431,-0.0086137205,0.0068902774,0.0091008657,-0.0037306491,-0.0087269943,0.0010917755,0.0077347404,0.0009324108,-0.0063640198,-0.0023221082,0.0048324894,0.0031188634,-0.0033206895,-0.0034093267,0.0019628300,0.0033074119,-0.0008435090,-0.0029367762,-0.0000000000,0.0024153577,0.0005708255,-0.0018433441,-0.0009022957,0.0012954429,0.0010460532,-0.0008177600,-0.0010601225,0.0004290296,0.0009984131,-0.0001254454,-0.0009028220,-0.0001120273,0.0007986677,0.0003091861};

const xip_fir_v7_2_pattern fir_compiler_0_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_compiler_0_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_compiler_0";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 2;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_compiler_0_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 127;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 24;
  config.coeff_fract_width   = 23;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 2;
  config.init_pattern        = fir_compiler_0_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 24;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_CONVERGENT_ODD;
  config.output_width        = 32;
  config.output_fract_width  = 5,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_compiler_0_config = gen_fir_compiler_0_config();

