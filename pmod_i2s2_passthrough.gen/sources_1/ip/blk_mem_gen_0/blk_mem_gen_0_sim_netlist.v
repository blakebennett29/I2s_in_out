// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Feb 17 09:36:38 2026
// Host        : Blakes-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/School/SeniorProject/pmod_i2s2_passthrough/pmod_i2s2_passthrough.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "32" *) 
  (* C_READ_DEPTH_B = "32" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19536)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
