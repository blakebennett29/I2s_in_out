// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Mar 25 21:19:56 2026
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
