
//
// Verific Verilog Description of module URAM288
//

module URAM288 (CAS_OUT_ADDR_A, CAS_OUT_ADDR_B, CAS_OUT_BWE_A, CAS_OUT_BWE_B, 
            CAS_OUT_DBITERR_A, CAS_OUT_DBITERR_B, CAS_OUT_DIN_A, CAS_OUT_DIN_B, 
            CAS_OUT_DOUT_A, CAS_OUT_DOUT_B, CAS_OUT_EN_A, CAS_OUT_EN_B, 
            CAS_OUT_RDACCESS_A, CAS_OUT_RDACCESS_B, CAS_OUT_RDB_WR_A, 
            CAS_OUT_RDB_WR_B, CAS_OUT_SBITERR_A, CAS_OUT_SBITERR_B, DBITERR_A, 
            DBITERR_B, DOUT_A, DOUT_B, RDACCESS_A, RDACCESS_B, SBITERR_A, 
            SBITERR_B, ADDR_A, ADDR_B, BWE_A, BWE_B, CAS_IN_ADDR_A, 
            CAS_IN_ADDR_B, CAS_IN_BWE_A, CAS_IN_BWE_B, CAS_IN_DBITERR_A, 
            CAS_IN_DBITERR_B, CAS_IN_DIN_A, CAS_IN_DIN_B, CAS_IN_DOUT_A, 
            CAS_IN_DOUT_B, CAS_IN_EN_A, CAS_IN_EN_B, CAS_IN_RDACCESS_A, 
            CAS_IN_RDACCESS_B, CAS_IN_RDB_WR_A, CAS_IN_RDB_WR_B, CAS_IN_SBITERR_A, 
            CAS_IN_SBITERR_B, CLK, DIN_A, DIN_B, EN_A, EN_B, INJECT_DBITERR_A, 
            INJECT_DBITERR_B, INJECT_SBITERR_A, INJECT_SBITERR_B, OREG_CE_A, 
            OREG_CE_B, OREG_ECC_CE_A, OREG_ECC_CE_B, RDB_WR_A, RDB_WR_B, 
            RST_A, RST_B, SHUTDOWN, SLEEP);   // URAM288.v(26)
    output [22:0]CAS_OUT_ADDR_A;   // URAM288.v(65)
    output [22:0]CAS_OUT_ADDR_B;   // URAM288.v(66)
    output [8:0]CAS_OUT_BWE_A;   // URAM288.v(67)
    output [8:0]CAS_OUT_BWE_B;   // URAM288.v(68)
    output CAS_OUT_DBITERR_A;   // URAM288.v(69)
    output CAS_OUT_DBITERR_B;   // URAM288.v(70)
    output [71:0]CAS_OUT_DIN_A;   // URAM288.v(71)
    output [71:0]CAS_OUT_DIN_B;   // URAM288.v(72)
    output [71:0]CAS_OUT_DOUT_A;   // URAM288.v(73)
    output [71:0]CAS_OUT_DOUT_B;   // URAM288.v(74)
    output CAS_OUT_EN_A;   // URAM288.v(75)
    output CAS_OUT_EN_B;   // URAM288.v(76)
    output CAS_OUT_RDACCESS_A;   // URAM288.v(77)
    output CAS_OUT_RDACCESS_B;   // URAM288.v(78)
    output CAS_OUT_RDB_WR_A;   // URAM288.v(79)
    output CAS_OUT_RDB_WR_B;   // URAM288.v(80)
    output CAS_OUT_SBITERR_A;   // URAM288.v(81)
    output CAS_OUT_SBITERR_B;   // URAM288.v(82)
    output DBITERR_A;   // URAM288.v(83)
    output DBITERR_B;   // URAM288.v(84)
    output [71:0]DOUT_A;   // URAM288.v(85)
    output [71:0]DOUT_B;   // URAM288.v(86)
    output RDACCESS_A;   // URAM288.v(87)
    output RDACCESS_B;   // URAM288.v(88)
    output SBITERR_A;   // URAM288.v(89)
    output SBITERR_B;   // URAM288.v(90)
    input [22:0]ADDR_A;   // URAM288.v(92)
    input [22:0]ADDR_B;   // URAM288.v(93)
    input [8:0]BWE_A;   // URAM288.v(94)
    input [8:0]BWE_B;   // URAM288.v(95)
    input [22:0]CAS_IN_ADDR_A;   // URAM288.v(96)
    input [22:0]CAS_IN_ADDR_B;   // URAM288.v(97)
    input [8:0]CAS_IN_BWE_A;   // URAM288.v(98)
    input [8:0]CAS_IN_BWE_B;   // URAM288.v(99)
    input CAS_IN_DBITERR_A;   // URAM288.v(100)
    input CAS_IN_DBITERR_B;   // URAM288.v(101)
    input [71:0]CAS_IN_DIN_A;   // URAM288.v(102)
    input [71:0]CAS_IN_DIN_B;   // URAM288.v(103)
    input [71:0]CAS_IN_DOUT_A;   // URAM288.v(104)
    input [71:0]CAS_IN_DOUT_B;   // URAM288.v(105)
    input CAS_IN_EN_A;   // URAM288.v(106)
    input CAS_IN_EN_B;   // URAM288.v(107)
    input CAS_IN_RDACCESS_A;   // URAM288.v(108)
    input CAS_IN_RDACCESS_B;   // URAM288.v(109)
    input CAS_IN_RDB_WR_A;   // URAM288.v(110)
    input CAS_IN_RDB_WR_B;   // URAM288.v(111)
    input CAS_IN_SBITERR_A;   // URAM288.v(112)
    input CAS_IN_SBITERR_B;   // URAM288.v(113)
    input CLK;   // URAM288.v(114)
    input [71:0]DIN_A;   // URAM288.v(115)
    input [71:0]DIN_B;   // URAM288.v(116)
    input EN_A;   // URAM288.v(117)
    input EN_B;   // URAM288.v(118)
    input INJECT_DBITERR_A;   // URAM288.v(119)
    input INJECT_DBITERR_B;   // URAM288.v(120)
    input INJECT_SBITERR_A;   // URAM288.v(121)
    input INJECT_SBITERR_B;   // URAM288.v(122)
    input OREG_CE_A;   // URAM288.v(123)
    input OREG_CE_B;   // URAM288.v(124)
    input OREG_ECC_CE_A;   // URAM288.v(125)
    input OREG_ECC_CE_B;   // URAM288.v(126)
    input RDB_WR_A;   // URAM288.v(127)
    input RDB_WR_B;   // URAM288.v(128)
    input RST_A;   // URAM288.v(129)
    input RST_B;   // URAM288.v(130)
    input SHUTDOWN;   // URAM288.v(131)
    input SLEEP;   // URAM288.v(132)
    
    wire [22:0]ADDR_A_BUS;   // URAM288.v(136)
    wire [22:0]ADDR_B_BUS;   // URAM288.v(139)
    
    mux_23 \GND_593326_o_ADDR_A[22]_mux_0  (.d0({23'b0xxxxxxxxxxxxxxxxxxxxxx}), 
           .d1({ADDR_A}), .cond(1'b1), .o({ADDR_A_BUS[22], Open_0, Open_1, 
           Open_2, Open_3, Open_4, Open_5, Open_6, Open_7, Open_8, 
           Open_9, Open_10, Open_11, Open_12, Open_13, Open_14, 
           Open_15, Open_16, Open_17, Open_18, Open_19, Open_20, 
           Open_21}));   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[21], ADDR_A[21], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[20], ADDR_A[20], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[19], ADDR_A[19], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[18], ADDR_A[18], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[17], ADDR_A[17], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[16], ADDR_A[16], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[15], ADDR_A[15], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[14], ADDR_A[14], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[13], ADDR_A[13], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[12], ADDR_A[12], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[11], ADDR_A[11], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[10], ADDR_A[10], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[9], ADDR_A[9], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[8], ADDR_A[8], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[7], ADDR_A[7], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[6], ADDR_A[6], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[5], ADDR_A[5], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[4], ADDR_A[4], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[3], ADDR_A[3], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[2], ADDR_A[2], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[1], ADDR_A[1], 1'b1) ;   // URAM288.v(137)
    bufif1 (ADDR_A_BUS[0], ADDR_A[0], 1'b1) ;   // URAM288.v(137)
    mux_23 \GND_593326_o_ADDR_B[22]_mux_1  (.d0({23'b0xxxxxxxxxxxxxxxxxxxxxx}), 
           .d1({ADDR_B}), .cond(1'b1), .o({ADDR_B_BUS[22], Open_22, 
           Open_23, Open_24, Open_25, Open_26, Open_27, Open_28, 
           Open_29, Open_30, Open_31, Open_32, Open_33, Open_34, 
           Open_35, Open_36, Open_37, Open_38, Open_39, Open_40, 
           Open_41, Open_42, Open_43}));   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[21], ADDR_B[21], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[20], ADDR_B[20], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[19], ADDR_B[19], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[18], ADDR_B[18], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[17], ADDR_B[17], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[16], ADDR_B[16], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[15], ADDR_B[15], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[14], ADDR_B[14], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[13], ADDR_B[13], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[12], ADDR_B[12], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[11], ADDR_B[11], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[10], ADDR_B[10], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[9], ADDR_B[9], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[8], ADDR_B[8], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[7], ADDR_B[7], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[6], ADDR_B[6], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[5], ADDR_B[5], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[4], ADDR_B[4], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[3], ADDR_B[3], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[2], ADDR_B[2], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[1], ADDR_B[1], 1'b1) ;   // URAM288.v(140)
    bufif1 (ADDR_B_BUS[0], ADDR_B[0], 1'b1) ;   // URAM288.v(140)
    URAM288_INT URAM288_i (.CAS_OUT_ADDR_A({CAS_OUT_ADDR_A}), .CAS_OUT_ADDR_B({CAS_OUT_ADDR_B}), 
            .CAS_OUT_BWE_A({CAS_OUT_BWE_A}), .CAS_OUT_BWE_B({CAS_OUT_BWE_B}), 
            .CAS_OUT_DBITERR_A(CAS_OUT_DBITERR_A), .CAS_OUT_DBITERR_B(CAS_OUT_DBITERR_B), 
            .CAS_OUT_DIN_A({CAS_OUT_DIN_A}), .CAS_OUT_DIN_B({CAS_OUT_DIN_B}), 
            .CAS_OUT_DOUT_A({CAS_OUT_DOUT_A}), .CAS_OUT_DOUT_B({CAS_OUT_DOUT_B}), 
            .CAS_OUT_EN_A(CAS_OUT_EN_A), .CAS_OUT_EN_B(CAS_OUT_EN_B), .CAS_OUT_RDACCESS_A(CAS_OUT_RDACCESS_A), 
            .CAS_OUT_RDACCESS_B(CAS_OUT_RDACCESS_B), .CAS_OUT_RDB_WR_A(CAS_OUT_RDB_WR_A), 
            .CAS_OUT_RDB_WR_B(CAS_OUT_RDB_WR_B), .CAS_OUT_SBITERR_A(CAS_OUT_SBITERR_A), 
            .CAS_OUT_SBITERR_B(CAS_OUT_SBITERR_B), .DBITERR_A(DBITERR_A), 
            .DBITERR_B(DBITERR_B), .DOUT_A({DOUT_A}), .DOUT_B({DOUT_B}), 
            .RDACCESS_A(RDACCESS_A), .RDACCESS_B(RDACCESS_B), .SBITERR_A(SBITERR_A), 
            .SBITERR_B(SBITERR_B), .ADDR_A({ADDR_A_BUS}), .ADDR_B({ADDR_B_BUS}), 
            .BWE_A({BWE_A}), .BWE_B({BWE_B}), .CAS_IN_ADDR_A({CAS_IN_ADDR_A}), 
            .CAS_IN_ADDR_B({CAS_IN_ADDR_B}), .CAS_IN_BWE_A({CAS_IN_BWE_A}), 
            .CAS_IN_BWE_B({CAS_IN_BWE_B}), .CAS_IN_DBITERR_A(CAS_IN_DBITERR_A), 
            .CAS_IN_DBITERR_B(CAS_IN_DBITERR_B), .CAS_IN_DIN_A({CAS_IN_DIN_A}), 
            .CAS_IN_DIN_B({CAS_IN_DIN_B}), .CAS_IN_DOUT_A({CAS_IN_DOUT_A}), 
            .CAS_IN_DOUT_B({CAS_IN_DOUT_B}), .CAS_IN_EN_A(CAS_IN_EN_A), 
            .CAS_IN_EN_B(CAS_IN_EN_B), .CAS_IN_RDACCESS_A(CAS_IN_RDACCESS_A), 
            .CAS_IN_RDACCESS_B(CAS_IN_RDACCESS_B), .CAS_IN_RDB_WR_A(CAS_IN_RDB_WR_A), 
            .CAS_IN_RDB_WR_B(CAS_IN_RDB_WR_B), .CAS_IN_SBITERR_A(CAS_IN_SBITERR_A), 
            .CAS_IN_SBITERR_B(CAS_IN_SBITERR_B), .CLK(CLK), .DIN_A({DIN_A}), 
            .DIN_B({DIN_B}), .EN_A(EN_A), .EN_B(EN_B), .INJECT_DBITERR_A(INJECT_DBITERR_A), 
            .INJECT_DBITERR_B(INJECT_DBITERR_B), .INJECT_SBITERR_A(INJECT_SBITERR_A), 
            .INJECT_SBITERR_B(INJECT_SBITERR_B), .OREG_CE_A(OREG_CE_A), 
            .OREG_CE_B(OREG_CE_B), .OREG_ECC_CE_A(OREG_ECC_CE_A), .OREG_ECC_CE_B(OREG_ECC_CE_B), 
            .RDB_WR_A(RDB_WR_A), .RDB_WR_B(RDB_WR_B), .RST_A(RST_A), .RST_B(RST_B), 
            .SHUTDOWN(SHUTDOWN), .SLEEP(SLEEP));   // URAM288.v(151)
    
endmodule

//
// Verific Verilog Description of OPERATOR mux_23
//

module mux_23 (d0, d1, cond, o);
    input [22:0]d0;
    input [22:0]d1;
    input cond;
    output [22:0]o;
    
    assign o = (cond ? d1 : d0);
    
endmodule

//
// Verific Verilog Description of module URAM288_INT
//

module URAM288_INT (CAS_OUT_ADDR_A, CAS_OUT_ADDR_B, CAS_OUT_BWE_A, CAS_OUT_BWE_B, 
            CAS_OUT_DBITERR_A, CAS_OUT_DBITERR_B, CAS_OUT_DIN_A, CAS_OUT_DIN_B, 
            CAS_OUT_DOUT_A, CAS_OUT_DOUT_B, CAS_OUT_EN_A, CAS_OUT_EN_B, 
            CAS_OUT_RDACCESS_A, CAS_OUT_RDACCESS_B, CAS_OUT_RDB_WR_A, 
            CAS_OUT_RDB_WR_B, CAS_OUT_SBITERR_A, CAS_OUT_SBITERR_B, DBITERR_A, 
            DBITERR_B, DOUT_A, DOUT_B, RDACCESS_A, RDACCESS_B, SBITERR_A, 
            SBITERR_B, ADDR_A, ADDR_B, BWE_A, BWE_B, CAS_IN_ADDR_A, 
            CAS_IN_ADDR_B, CAS_IN_BWE_A, CAS_IN_BWE_B, CAS_IN_DBITERR_A, 
            CAS_IN_DBITERR_B, CAS_IN_DIN_A, CAS_IN_DIN_B, CAS_IN_DOUT_A, 
            CAS_IN_DOUT_B, CAS_IN_EN_A, CAS_IN_EN_B, CAS_IN_RDACCESS_A, 
            CAS_IN_RDACCESS_B, CAS_IN_RDB_WR_A, CAS_IN_RDB_WR_B, CAS_IN_SBITERR_A, 
            CAS_IN_SBITERR_B, CLK, DIN_A, DIN_B, EN_A, EN_B, INJECT_DBITERR_A, 
            INJECT_DBITERR_B, INJECT_SBITERR_A, INJECT_SBITERR_B, OREG_CE_A, 
            OREG_CE_B, OREG_ECC_CE_A, OREG_ECC_CE_B, RDB_WR_A, RDB_WR_B, 
            RST_A, RST_B, SHUTDOWN, SLEEP);   // URAM288.v(226)
    output [22:0]CAS_OUT_ADDR_A;   // URAM288.v(267)
    output [22:0]CAS_OUT_ADDR_B;   // URAM288.v(268)
    output [8:0]CAS_OUT_BWE_A;   // URAM288.v(269)
    output [8:0]CAS_OUT_BWE_B;   // URAM288.v(270)
    output CAS_OUT_DBITERR_A;   // URAM288.v(271)
    output CAS_OUT_DBITERR_B;   // URAM288.v(272)
    output [71:0]CAS_OUT_DIN_A;   // URAM288.v(273)
    output [71:0]CAS_OUT_DIN_B;   // URAM288.v(274)
    output [71:0]CAS_OUT_DOUT_A;   // URAM288.v(275)
    output [71:0]CAS_OUT_DOUT_B;   // URAM288.v(276)
    output CAS_OUT_EN_A;   // URAM288.v(277)
    output CAS_OUT_EN_B;   // URAM288.v(278)
    output CAS_OUT_RDACCESS_A;   // URAM288.v(279)
    output CAS_OUT_RDACCESS_B;   // URAM288.v(280)
    output CAS_OUT_RDB_WR_A;   // URAM288.v(281)
    output CAS_OUT_RDB_WR_B;   // URAM288.v(282)
    output CAS_OUT_SBITERR_A;   // URAM288.v(283)
    output CAS_OUT_SBITERR_B;   // URAM288.v(284)
    output DBITERR_A;   // URAM288.v(285)
    output DBITERR_B;   // URAM288.v(286)
    output [71:0]DOUT_A;   // URAM288.v(287)
    output [71:0]DOUT_B;   // URAM288.v(288)
    output RDACCESS_A;   // URAM288.v(289)
    output RDACCESS_B;   // URAM288.v(290)
    output SBITERR_A;   // URAM288.v(291)
    output SBITERR_B;   // URAM288.v(292)
    input [22:0]ADDR_A;   // URAM288.v(294)
    input [22:0]ADDR_B;   // URAM288.v(295)
    input [8:0]BWE_A;   // URAM288.v(296)
    input [8:0]BWE_B;   // URAM288.v(297)
    input [22:0]CAS_IN_ADDR_A;   // URAM288.v(298)
    input [22:0]CAS_IN_ADDR_B;   // URAM288.v(299)
    input [8:0]CAS_IN_BWE_A;   // URAM288.v(300)
    input [8:0]CAS_IN_BWE_B;   // URAM288.v(301)
    input CAS_IN_DBITERR_A;   // URAM288.v(302)
    input CAS_IN_DBITERR_B;   // URAM288.v(303)
    input [71:0]CAS_IN_DIN_A;   // URAM288.v(304)
    input [71:0]CAS_IN_DIN_B;   // URAM288.v(305)
    input [71:0]CAS_IN_DOUT_A;   // URAM288.v(306)
    input [71:0]CAS_IN_DOUT_B;   // URAM288.v(307)
    input CAS_IN_EN_A;   // URAM288.v(308)
    input CAS_IN_EN_B;   // URAM288.v(309)
    input CAS_IN_RDACCESS_A;   // URAM288.v(310)
    input CAS_IN_RDACCESS_B;   // URAM288.v(311)
    input CAS_IN_RDB_WR_A;   // URAM288.v(312)
    input CAS_IN_RDB_WR_B;   // URAM288.v(313)
    input CAS_IN_SBITERR_A;   // URAM288.v(314)
    input CAS_IN_SBITERR_B;   // URAM288.v(315)
    input CLK;   // URAM288.v(316)
    input [71:0]DIN_A;   // URAM288.v(317)
    input [71:0]DIN_B;   // URAM288.v(318)
    input EN_A;   // URAM288.v(319)
    input EN_B;   // URAM288.v(320)
    input INJECT_DBITERR_A;   // URAM288.v(321)
    input INJECT_DBITERR_B;   // URAM288.v(322)
    input INJECT_SBITERR_A;   // URAM288.v(323)
    input INJECT_SBITERR_B;   // URAM288.v(324)
    input OREG_CE_A;   // URAM288.v(325)
    input OREG_CE_B;   // URAM288.v(326)
    input OREG_ECC_CE_A;   // URAM288.v(327)
    input OREG_ECC_CE_B;   // URAM288.v(328)
    input RDB_WR_A;   // URAM288.v(329)
    input RDB_WR_B;   // URAM288.v(330)
    input RST_A;   // URAM288.v(331)
    input RST_B;   // URAM288.v(332)
    input SHUTDOWN;   // URAM288.v(333)
    input SLEEP;   // URAM288.v(334)
    
    reg [294911:0] mem /* Original declaration bounds: [0:4095][71:0] */  /* verific ORIG_DEPTH=4096, ORIG_WIDTH=72, ORIG_DEPTH_RANGE=[0:4095], ORIG_WIDTH_RANGE=[71:0], FULL_RANGE=[0:4095][71:0], BLOCKING=1 */ ;   // URAM288.v(1695)
    wire [11:0]ram_addr_a;   // URAM288.v(1698)
    wire [11:0]ram_addr_b;   // URAM288.v(1699)
    wire ram_ce_a;   // URAM288.v(1700)
    wire ram_ce_b;   // URAM288.v(1701)
    wire [15:1]ram_ce_a_fifo;   // URAM288.v(1705)
    wire [15:1]ram_ce_b_fifo;   // URAM288.v(1706)
    wire [71:0]ram_bwe_a;   // URAM288.v(1707)
    wire [71:0]ram_bwe_b;   // URAM288.v(1708)
    wire ram_we_a;   // URAM288.v(1709)
    wire ram_we_b;   // URAM288.v(1710)
    wire [71:0]ram_data_a;   // URAM288.v(1713)
    wire [71:0]ram_data_b;   // URAM288.v(1714)
    wire RST_A_async;   // URAM288.v(1747)
    wire RST_B_async;   // URAM288.v(1748)
    wire RST_A_sync;   // URAM288.v(1749)
    wire RST_B_sync;   // URAM288.v(1750)
    wire [31:0]wake_count;   // URAM288.v(1752)
    wire auto_sleep;   // URAM288.v(1753)
    wire shut_down;   // URAM288.v(1754)
    wire a_sleep;   // URAM288.v(1755)
    wire auto_sleep_A;   // URAM288.v(1756)
    wire auto_sleep_B;   // URAM288.v(1757)
    wire [71:0]ram_data_a_lat;   // URAM288.v(2169)
    wire [71:0]ram_data_b_lat;   // URAM288.v(2174)
    wire RDACCESS_A_lat;   // URAM288.v(2178)
    wire RDACCESS_B_lat;   // URAM288.v(2180)
    wire data_A_enable;   // URAM288.v(2377)
    wire data_B_enable;   // URAM288.v(2378)
    reg [7:0] synd_a_rd /* Original declaration bounds: [7:0] */  /* verific ORIG_DEPTH=8, ORIG_WIDTH=1, ORIG_DEPTH_RANGE=[7:0], FULL_RANGE=[7:0] */ ;   // URAM288.v(2905)
    reg [7:0] synd_a_ecc /* Original declaration bounds: [7:0] */  /* verific ORIG_DEPTH=8, ORIG_WIDTH=1, ORIG_DEPTH_RANGE=[7:0], FULL_RANGE=[7:0] */ ;   // URAM288.v(2906)
    reg [7:0] synd_b_rd /* Original declaration bounds: [7:0] */  /* verific ORIG_DEPTH=8, ORIG_WIDTH=1, ORIG_DEPTH_RANGE=[7:0], FULL_RANGE=[7:0] */ ;   // URAM288.v(2907)
    reg [7:0] synd_b_ecc /* Original declaration bounds: [7:0] */  /* verific ORIG_DEPTH=8, ORIG_WIDTH=1, ORIG_DEPTH_RANGE=[7:0], FULL_RANGE=[7:0] */ ;   // URAM288.v(2908)
    
    wire RST_A_sync_RST_A_in_XOR_82_o, RST_A_sync_RST_A_in_MUX_3249152_o, 
        RST_B_sync_RST_B_in_XOR_83_o, RST_B_sync_RST_B_in_MUX_3249153_o, 
        RST_A_async_RST_A_sync_OR_590624_o, RST_A_async_shut_down_OR_590625_o, 
        RST_A_async_a_sleep_OR_590626_o;
    wire [71:0]\GND_593371_o_ram_data_a_lat[71]_mux_21_OUT ;
    
    wire RST_B_async_RST_B_sync_OR_590639_o, RST_B_async_shut_down_OR_590640_o, 
        RST_B_async_a_sleep_OR_590641_o;
    wire [71:0]\GND_593371_o_ram_data_b_lat[71]_mux_23_OUT ;
    wire [10:0]\ADDR_A_int[22]_GND_593371_o_xor_37_OUT ;
    wire [10:0]\ADDR_A_int[22]_inv_38_OUT ;
    wire [10:0]\ADDR_A_int[22]_GND_593371_o_or_39_OUT ;
    
    wire \ADDR_A_int[22]_reduce_and_41_o ;
    wire [10:0]\ADDR_B_int[22]_GND_593371_o_xor_47_OUT ;
    wire [10:0]\ADDR_B_int[22]_inv_48_OUT ;
    wire [10:0]\ADDR_B_int[22]_GND_593371_o_or_49_OUT ;
    
    wire \ADDR_B_int[22]_reduce_and_51_o , RDB_WR_A_int_a_sleep_OR_590651_o, 
        RDB_WR_A_int_SLEEP_in_OR_590652_o, RDB_WR_A_int_auto_sleep_OR_590653_o, 
        RDB_WR_A_int_shut_down_OR_590654_o, RDB_WR_A_int_SHUTDOWN_in_OR_590655_o;
    wire [71:0]\ram_bwe_a[71]_BWE_A_int[7]_mux_52_OUT ;
    wire [71:0]\ram_bwe_a[71]_GND_593371_o_mux_53_OUT ;
    
    wire RDB_WR_B_int_a_sleep_OR_590656_o, RDB_WR_B_int_SLEEP_in_OR_590657_o, 
        RDB_WR_B_int_auto_sleep_OR_590658_o, RDB_WR_B_int_shut_down_OR_590659_o, 
        RDB_WR_B_int_SHUTDOWN_in_OR_590660_o;
    wire [71:0]\ram_bwe_b[71]_BWE_B_int[7]_mux_56_OUT ;
    wire [71:0]\ram_bwe_b[71]_GND_593371_o_mux_57_OUT ;
    
    wire a_sleep_SLEEP_in_OR_590661_o, a_sleep_auto_sleep_OR_590662_o, a_sleep_shut_down_OR_590663_o, 
        a_sleep_SHUTDOWN_in_OR_590664_o;
    wire [11:0]\ram_addr_a[11]_ADDR_A_int[11]_mux_60_OUT ;
    wire [11:0]\ram_addr_a[11]_GND_593371_o_mux_61_OUT ;
    wire [11:0]\ram_addr_b[11]_ADDR_B_int[11]_mux_64_OUT ;
    wire [11:0]\ram_addr_b[11]_GND_593371_o_mux_65_OUT ;
    
    wire ram_ce_a_int_INV_278_o, a_sleep_ram_ce_a_int_OR_590683_o, RDB_WR_A_int_GND_593371_o_MUX_3249221_o, 
        ram_ce_b_int_INV_280_o, a_sleep_ram_ce_b_int_OR_590688_o, RDB_WR_B_int_GND_593371_o_MUX_3249224_o, 
        RDB_WR_A_int_ram_ce_a_int_AND_598211_o;
    wire [71:0]\ram_data_a[71]_DIN_A_int[71]_mux_72_OUT ;
    wire [71:0]\ram_data_a[71]_GND_593371_o_mux_73_OUT ;
    
    wire RDB_WR_B_int_ram_ce_b_int_AND_598212_o;
    wire [71:0]\ram_data_b[71]_DIN_B_int[71]_mux_76_OUT ;
    wire [71:0]\ram_data_b[71]_GND_593371_o_mux_77_OUT ;
    
    wire auto_sleep_SHUTDOWN_in_OR_590697_o, RDB_WR_A_int_INV_283_o, ram_ce_a_int_RDB_WR_A_int_AND_598213_o, 
        RDB_WR_B_int_INV_285_o, ram_ce_b_int_RDB_WR_B_int_AND_598214_o, 
        CLK_in_INV_286_o;
    wire [71:0]\ram_data_a_out[71]_GND_593371_o_mux_80_OUT ;
    
    wire shut_down_INV_287_o, ram_we_a_shut_down_AND_598215_o, a_sleep_INV_288_o, 
        ram_we_a_a_sleep_AND_598216_o;
    wire [71:0]\ram_data_a[71]_ram_bwe_a[71]_and_81_OUT ;
    wire [71:0]\ram_addr_a[11]_read_port_82_OUT ;
    wire [71:0]\ram_bwe_a[71]_inv_83_OUT ;
    wire [71:0]\ram_addr_a[11]_ram_bwe_a[71]_and_84_OUT ;
    wire [71:0]\ram_data_a[71]_ram_addr_a[11]_or_85_OUT ;
    
    wire ram_we_a_INV_289_o, ram_ce_a_ram_we_a_AND_598217_o, RST_A_in_INV_290_o, 
        ram_ce_a_RST_A_in_AND_598218_o, ram_ce_a_shut_down_AND_598219_o, 
        ram_ce_a_a_sleep_AND_598220_o;
    wire [71:0]\ram_addr_a[11]_read_port_87_OUT ;
    wire [71:0]\ram_data_a_out[71]_ram_addr_a[11]_mux_88_OUT ;
    wire [71:0]\ram_data_b_out[71]_GND_593371_o_mux_89_OUT ;
    
    wire ram_we_b_shut_down_AND_598221_o, ram_we_b_a_sleep_AND_598222_o;
    wire [71:0]\ram_data_b[71]_ram_bwe_b[71]_and_90_OUT ;
    wire [71:0]\ram_addr_b[11]_read_port_91_OUT ;
    wire [71:0]\ram_bwe_b[71]_inv_92_OUT ;
    wire [71:0]\ram_addr_b[11]_ram_bwe_b[71]_and_93_OUT ;
    wire [71:0]\ram_data_b[71]_ram_addr_b[11]_or_94_OUT ;
    
    wire ram_we_b_INV_295_o, ram_ce_b_ram_we_b_AND_598223_o, RST_B_in_INV_296_o, 
        ram_ce_b_RST_B_in_AND_598224_o, ram_ce_b_shut_down_AND_598225_o, 
        ram_ce_b_a_sleep_AND_598226_o;
    wire [71:0]\ram_addr_b[11]_read_port_96_OUT ;
    wire [71:0]\ram_data_b_out[71]_ram_addr_b[11]_mux_97_OUT ;
    
    wire \wake_count[31]_GND_593371_o_LessThan_102_o , auto_sleep_SLEEP_in_OR_590705_o, 
        auto_sleep_SHUTDOWN_in_OR_590706_o, auto_sleep_INV_299_o, \wake_count[31]_auto_sleep_AND_598227_o , 
        SHUTDOWN_in_INV_300_o, \wake_count[31]_GND_593371_o_LessThan_103_o , 
        \SHUTDOWN_in_wake_count[31]_AND_598228_o , \wake_count[31]_SHUTDOWN_in_OR_590707_o , 
        \wake_count[31]_GND_593371_o_LessThan_104_o , \SHUTDOWN_in_wake_count[31]_AND_598229_o , 
        \wake_count[31]_SHUTDOWN_in_OR_590708_o ;
    wire [31:0]\wake_count[31]_GND_593371_o_sub_105_OUT ;
    
    wire \GND_593371_o_wake_count[31]_LessThan_106_o , SLEEP_in_GND_593371_o_AND_598230_o, 
        \GND_593371_o_wake_count[31]_LessThan_107_o , auto_sleep_GND_593371_o_AND_598231_o;
    wire [31:0]\wake_count[31]_GND_593371_o_mux_107_OUT ;
    wire [31:0]\wake_count[31]_GND_593371_o_mux_108_OUT ;
    wire [31:0]\wake_count[31]_GND_593371_o_mux_109_OUT ;
    wire [31:0]\wake_count[31]_wake_count[31]_mux_110_OUT ;
    wire [31:0]\wake_count[31]_GND_593371_o_mux_111_OUT ;
    
    wire auto_sleep_INV_302_o, \wake_count[31]_GND_593371_o_equal_115_o , 
        \auto_sleep_wake_count[31]_AND_598232_o , a_sleep_PWR_23_o_MUX_3249228_o, 
        a_sleep_GND_593371_o_MUX_3249229_o, shut_down_PWR_23_o_MUX_3249230_o, 
        shut_down_GND_593371_o_MUX_3249231_o, auto_sleep_A_auto_sleep_B_AND_598233_o, 
        auto_wake_up_A_INV_303_o, auto_sleep_A_auto_wake_up_A_AND_598234_o, 
        auto_wake_up_B_INV_304_o;
    
    assign CAS_OUT_ADDR_A[21] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[20] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[19] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[18] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[17] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[16] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[15] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[14] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[13] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[12] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[11] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[10] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[9] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[8] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[7] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[6] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[5] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[4] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[3] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[2] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[1] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_A[0] = 1'b0;   // URAM288.v(267)
    assign CAS_OUT_ADDR_B[22] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[21] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[20] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[19] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[18] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[17] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[16] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[15] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[14] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[13] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[12] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[11] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[10] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[9] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[8] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[7] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[6] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[5] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[4] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[3] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[2] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[1] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_ADDR_B[0] = 1'b0;   // URAM288.v(268)
    assign CAS_OUT_BWE_A[8] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[7] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[6] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[5] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[4] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[3] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[2] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[1] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_A[0] = 1'b0;   // URAM288.v(269)
    assign CAS_OUT_BWE_B[8] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[7] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[6] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[5] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[4] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[3] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[2] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[1] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_BWE_B[0] = 1'b0;   // URAM288.v(270)
    assign CAS_OUT_DIN_A[71] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[70] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[69] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[68] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[67] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[66] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[65] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[64] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[63] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[62] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[61] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[60] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[59] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[58] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[57] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[56] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[55] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[54] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[53] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[52] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[51] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[50] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[49] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[48] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[47] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[46] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[45] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[44] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[43] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[42] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[41] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[40] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[39] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[38] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[37] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[36] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[35] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[34] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[33] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[32] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[31] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[30] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[29] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[28] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[27] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[26] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[25] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[24] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[23] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[22] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[21] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[20] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[19] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[18] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[17] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[16] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[15] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[14] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[13] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[12] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[11] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[10] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[9] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[8] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[7] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[6] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[5] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[4] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[3] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[2] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[1] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_A[0] = 1'b0;   // URAM288.v(273)
    assign CAS_OUT_DIN_B[71] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[70] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[69] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[68] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[67] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[66] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[65] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[64] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[63] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[62] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[61] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[60] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[59] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[58] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[57] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[56] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[55] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[54] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[53] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[52] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[51] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[50] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[49] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[48] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[47] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[46] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[45] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[44] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[43] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[42] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[41] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[40] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[39] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[38] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[37] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[36] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[35] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[34] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[33] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[32] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[31] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[30] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[29] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[28] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[27] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[26] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[25] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[24] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[23] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[22] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[21] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[20] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[19] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[18] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[17] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[16] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[15] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[14] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[13] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[12] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[11] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[10] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[9] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[8] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[7] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[6] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[5] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[4] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[3] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[2] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[1] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_DIN_B[0] = 1'b0;   // URAM288.v(274)
    assign CAS_OUT_EN_A = 1'b0;   // URAM288.v(277)
    assign CAS_OUT_EN_B = 1'b0;   // URAM288.v(278)
    assign CAS_OUT_RDB_WR_A = 1'b0;   // URAM288.v(281)
    assign CAS_OUT_RDB_WR_B = 1'b0;   // URAM288.v(282)
    assign DBITERR_A = CAS_OUT_DBITERR_A;   // URAM288.v(285)
    assign DBITERR_B = CAS_OUT_DBITERR_B;   // URAM288.v(286)
    assign DOUT_A[71] = CAS_OUT_DOUT_A[71];   // URAM288.v(287)
    assign DOUT_A[70] = CAS_OUT_DOUT_A[70];   // URAM288.v(287)
    assign DOUT_A[69] = CAS_OUT_DOUT_A[69];   // URAM288.v(287)
    assign DOUT_A[68] = CAS_OUT_DOUT_A[68];   // URAM288.v(287)
    assign DOUT_A[67] = CAS_OUT_DOUT_A[67];   // URAM288.v(287)
    assign DOUT_A[66] = CAS_OUT_DOUT_A[66];   // URAM288.v(287)
    assign DOUT_A[65] = CAS_OUT_DOUT_A[65];   // URAM288.v(287)
    assign DOUT_A[64] = CAS_OUT_DOUT_A[64];   // URAM288.v(287)
    assign DOUT_A[63] = CAS_OUT_DOUT_A[63];   // URAM288.v(287)
    assign DOUT_A[62] = CAS_OUT_DOUT_A[62];   // URAM288.v(287)
    assign DOUT_A[61] = CAS_OUT_DOUT_A[61];   // URAM288.v(287)
    assign DOUT_A[60] = CAS_OUT_DOUT_A[60];   // URAM288.v(287)
    assign DOUT_A[59] = CAS_OUT_DOUT_A[59];   // URAM288.v(287)
    assign DOUT_A[58] = CAS_OUT_DOUT_A[58];   // URAM288.v(287)
    assign DOUT_A[57] = CAS_OUT_DOUT_A[57];   // URAM288.v(287)
    assign DOUT_A[56] = CAS_OUT_DOUT_A[56];   // URAM288.v(287)
    assign DOUT_A[55] = CAS_OUT_DOUT_A[55];   // URAM288.v(287)
    assign DOUT_A[54] = CAS_OUT_DOUT_A[54];   // URAM288.v(287)
    assign DOUT_A[53] = CAS_OUT_DOUT_A[53];   // URAM288.v(287)
    assign DOUT_A[52] = CAS_OUT_DOUT_A[52];   // URAM288.v(287)
    assign DOUT_A[51] = CAS_OUT_DOUT_A[51];   // URAM288.v(287)
    assign DOUT_A[50] = CAS_OUT_DOUT_A[50];   // URAM288.v(287)
    assign DOUT_A[49] = CAS_OUT_DOUT_A[49];   // URAM288.v(287)
    assign DOUT_A[48] = CAS_OUT_DOUT_A[48];   // URAM288.v(287)
    assign DOUT_A[47] = CAS_OUT_DOUT_A[47];   // URAM288.v(287)
    assign DOUT_A[46] = CAS_OUT_DOUT_A[46];   // URAM288.v(287)
    assign DOUT_A[45] = CAS_OUT_DOUT_A[45];   // URAM288.v(287)
    assign DOUT_A[44] = CAS_OUT_DOUT_A[44];   // URAM288.v(287)
    assign DOUT_A[43] = CAS_OUT_DOUT_A[43];   // URAM288.v(287)
    assign DOUT_A[42] = CAS_OUT_DOUT_A[42];   // URAM288.v(287)
    assign DOUT_A[41] = CAS_OUT_DOUT_A[41];   // URAM288.v(287)
    assign DOUT_A[40] = CAS_OUT_DOUT_A[40];   // URAM288.v(287)
    assign DOUT_A[39] = CAS_OUT_DOUT_A[39];   // URAM288.v(287)
    assign DOUT_A[38] = CAS_OUT_DOUT_A[38];   // URAM288.v(287)
    assign DOUT_A[37] = CAS_OUT_DOUT_A[37];   // URAM288.v(287)
    assign DOUT_A[36] = CAS_OUT_DOUT_A[36];   // URAM288.v(287)
    assign DOUT_A[35] = CAS_OUT_DOUT_A[35];   // URAM288.v(287)
    assign DOUT_A[34] = CAS_OUT_DOUT_A[34];   // URAM288.v(287)
    assign DOUT_A[33] = CAS_OUT_DOUT_A[33];   // URAM288.v(287)
    assign DOUT_A[32] = CAS_OUT_DOUT_A[32];   // URAM288.v(287)
    assign DOUT_A[31] = CAS_OUT_DOUT_A[31];   // URAM288.v(287)
    assign DOUT_A[30] = CAS_OUT_DOUT_A[30];   // URAM288.v(287)
    assign DOUT_A[29] = CAS_OUT_DOUT_A[29];   // URAM288.v(287)
    assign DOUT_A[28] = CAS_OUT_DOUT_A[28];   // URAM288.v(287)
    assign DOUT_A[27] = CAS_OUT_DOUT_A[27];   // URAM288.v(287)
    assign DOUT_A[26] = CAS_OUT_DOUT_A[26];   // URAM288.v(287)
    assign DOUT_A[25] = CAS_OUT_DOUT_A[25];   // URAM288.v(287)
    assign DOUT_A[24] = CAS_OUT_DOUT_A[24];   // URAM288.v(287)
    assign DOUT_A[23] = CAS_OUT_DOUT_A[23];   // URAM288.v(287)
    assign DOUT_A[22] = CAS_OUT_DOUT_A[22];   // URAM288.v(287)
    assign DOUT_A[21] = CAS_OUT_DOUT_A[21];   // URAM288.v(287)
    assign DOUT_A[20] = CAS_OUT_DOUT_A[20];   // URAM288.v(287)
    assign DOUT_A[19] = CAS_OUT_DOUT_A[19];   // URAM288.v(287)
    assign DOUT_A[18] = CAS_OUT_DOUT_A[18];   // URAM288.v(287)
    assign DOUT_A[17] = CAS_OUT_DOUT_A[17];   // URAM288.v(287)
    assign DOUT_A[16] = CAS_OUT_DOUT_A[16];   // URAM288.v(287)
    assign DOUT_A[15] = CAS_OUT_DOUT_A[15];   // URAM288.v(287)
    assign DOUT_A[14] = CAS_OUT_DOUT_A[14];   // URAM288.v(287)
    assign DOUT_A[13] = CAS_OUT_DOUT_A[13];   // URAM288.v(287)
    assign DOUT_A[12] = CAS_OUT_DOUT_A[12];   // URAM288.v(287)
    assign DOUT_A[11] = CAS_OUT_DOUT_A[11];   // URAM288.v(287)
    assign DOUT_A[10] = CAS_OUT_DOUT_A[10];   // URAM288.v(287)
    assign DOUT_A[9] = CAS_OUT_DOUT_A[9];   // URAM288.v(287)
    assign DOUT_A[8] = CAS_OUT_DOUT_A[8];   // URAM288.v(287)
    assign DOUT_A[7] = CAS_OUT_DOUT_A[7];   // URAM288.v(287)
    assign DOUT_A[6] = CAS_OUT_DOUT_A[6];   // URAM288.v(287)
    assign DOUT_A[5] = CAS_OUT_DOUT_A[5];   // URAM288.v(287)
    assign DOUT_A[4] = CAS_OUT_DOUT_A[4];   // URAM288.v(287)
    assign DOUT_A[3] = CAS_OUT_DOUT_A[3];   // URAM288.v(287)
    assign DOUT_A[2] = CAS_OUT_DOUT_A[2];   // URAM288.v(287)
    assign DOUT_A[1] = CAS_OUT_DOUT_A[1];   // URAM288.v(287)
    assign DOUT_A[0] = CAS_OUT_DOUT_A[0];   // URAM288.v(287)
    assign DOUT_B[71] = CAS_OUT_DOUT_B[71];   // URAM288.v(288)
    assign DOUT_B[70] = CAS_OUT_DOUT_B[70];   // URAM288.v(288)
    assign DOUT_B[69] = CAS_OUT_DOUT_B[69];   // URAM288.v(288)
    assign DOUT_B[68] = CAS_OUT_DOUT_B[68];   // URAM288.v(288)
    assign DOUT_B[67] = CAS_OUT_DOUT_B[67];   // URAM288.v(288)
    assign DOUT_B[66] = CAS_OUT_DOUT_B[66];   // URAM288.v(288)
    assign DOUT_B[65] = CAS_OUT_DOUT_B[65];   // URAM288.v(288)
    assign DOUT_B[64] = CAS_OUT_DOUT_B[64];   // URAM288.v(288)
    assign DOUT_B[63] = CAS_OUT_DOUT_B[63];   // URAM288.v(288)
    assign DOUT_B[62] = CAS_OUT_DOUT_B[62];   // URAM288.v(288)
    assign DOUT_B[61] = CAS_OUT_DOUT_B[61];   // URAM288.v(288)
    assign DOUT_B[60] = CAS_OUT_DOUT_B[60];   // URAM288.v(288)
    assign DOUT_B[59] = CAS_OUT_DOUT_B[59];   // URAM288.v(288)
    assign DOUT_B[58] = CAS_OUT_DOUT_B[58];   // URAM288.v(288)
    assign DOUT_B[57] = CAS_OUT_DOUT_B[57];   // URAM288.v(288)
    assign DOUT_B[56] = CAS_OUT_DOUT_B[56];   // URAM288.v(288)
    assign DOUT_B[55] = CAS_OUT_DOUT_B[55];   // URAM288.v(288)
    assign DOUT_B[54] = CAS_OUT_DOUT_B[54];   // URAM288.v(288)
    assign DOUT_B[53] = CAS_OUT_DOUT_B[53];   // URAM288.v(288)
    assign DOUT_B[52] = CAS_OUT_DOUT_B[52];   // URAM288.v(288)
    assign DOUT_B[51] = CAS_OUT_DOUT_B[51];   // URAM288.v(288)
    assign DOUT_B[50] = CAS_OUT_DOUT_B[50];   // URAM288.v(288)
    assign DOUT_B[49] = CAS_OUT_DOUT_B[49];   // URAM288.v(288)
    assign DOUT_B[48] = CAS_OUT_DOUT_B[48];   // URAM288.v(288)
    assign DOUT_B[47] = CAS_OUT_DOUT_B[47];   // URAM288.v(288)
    assign DOUT_B[46] = CAS_OUT_DOUT_B[46];   // URAM288.v(288)
    assign DOUT_B[45] = CAS_OUT_DOUT_B[45];   // URAM288.v(288)
    assign DOUT_B[44] = CAS_OUT_DOUT_B[44];   // URAM288.v(288)
    assign DOUT_B[43] = CAS_OUT_DOUT_B[43];   // URAM288.v(288)
    assign DOUT_B[42] = CAS_OUT_DOUT_B[42];   // URAM288.v(288)
    assign DOUT_B[41] = CAS_OUT_DOUT_B[41];   // URAM288.v(288)
    assign DOUT_B[40] = CAS_OUT_DOUT_B[40];   // URAM288.v(288)
    assign DOUT_B[39] = CAS_OUT_DOUT_B[39];   // URAM288.v(288)
    assign DOUT_B[38] = CAS_OUT_DOUT_B[38];   // URAM288.v(288)
    assign DOUT_B[37] = CAS_OUT_DOUT_B[37];   // URAM288.v(288)
    assign DOUT_B[36] = CAS_OUT_DOUT_B[36];   // URAM288.v(288)
    assign DOUT_B[35] = CAS_OUT_DOUT_B[35];   // URAM288.v(288)
    assign DOUT_B[34] = CAS_OUT_DOUT_B[34];   // URAM288.v(288)
    assign DOUT_B[33] = CAS_OUT_DOUT_B[33];   // URAM288.v(288)
    assign DOUT_B[32] = CAS_OUT_DOUT_B[32];   // URAM288.v(288)
    assign DOUT_B[31] = CAS_OUT_DOUT_B[31];   // URAM288.v(288)
    assign DOUT_B[30] = CAS_OUT_DOUT_B[30];   // URAM288.v(288)
    assign DOUT_B[29] = CAS_OUT_DOUT_B[29];   // URAM288.v(288)
    assign DOUT_B[28] = CAS_OUT_DOUT_B[28];   // URAM288.v(288)
    assign DOUT_B[27] = CAS_OUT_DOUT_B[27];   // URAM288.v(288)
    assign DOUT_B[26] = CAS_OUT_DOUT_B[26];   // URAM288.v(288)
    assign DOUT_B[25] = CAS_OUT_DOUT_B[25];   // URAM288.v(288)
    assign DOUT_B[24] = CAS_OUT_DOUT_B[24];   // URAM288.v(288)
    assign DOUT_B[23] = CAS_OUT_DOUT_B[23];   // URAM288.v(288)
    assign DOUT_B[22] = CAS_OUT_DOUT_B[22];   // URAM288.v(288)
    assign DOUT_B[21] = CAS_OUT_DOUT_B[21];   // URAM288.v(288)
    assign DOUT_B[20] = CAS_OUT_DOUT_B[20];   // URAM288.v(288)
    assign DOUT_B[19] = CAS_OUT_DOUT_B[19];   // URAM288.v(288)
    assign DOUT_B[18] = CAS_OUT_DOUT_B[18];   // URAM288.v(288)
    assign DOUT_B[17] = CAS_OUT_DOUT_B[17];   // URAM288.v(288)
    assign DOUT_B[16] = CAS_OUT_DOUT_B[16];   // URAM288.v(288)
    assign DOUT_B[15] = CAS_OUT_DOUT_B[15];   // URAM288.v(288)
    assign DOUT_B[14] = CAS_OUT_DOUT_B[14];   // URAM288.v(288)
    assign DOUT_B[13] = CAS_OUT_DOUT_B[13];   // URAM288.v(288)
    assign DOUT_B[12] = CAS_OUT_DOUT_B[12];   // URAM288.v(288)
    assign DOUT_B[11] = CAS_OUT_DOUT_B[11];   // URAM288.v(288)
    assign DOUT_B[10] = CAS_OUT_DOUT_B[10];   // URAM288.v(288)
    assign DOUT_B[9] = CAS_OUT_DOUT_B[9];   // URAM288.v(288)
    assign DOUT_B[8] = CAS_OUT_DOUT_B[8];   // URAM288.v(288)
    assign DOUT_B[7] = CAS_OUT_DOUT_B[7];   // URAM288.v(288)
    assign DOUT_B[6] = CAS_OUT_DOUT_B[6];   // URAM288.v(288)
    assign DOUT_B[5] = CAS_OUT_DOUT_B[5];   // URAM288.v(288)
    assign DOUT_B[4] = CAS_OUT_DOUT_B[4];   // URAM288.v(288)
    assign DOUT_B[3] = CAS_OUT_DOUT_B[3];   // URAM288.v(288)
    assign DOUT_B[2] = CAS_OUT_DOUT_B[2];   // URAM288.v(288)
    assign DOUT_B[1] = CAS_OUT_DOUT_B[1];   // URAM288.v(288)
    assign DOUT_B[0] = CAS_OUT_DOUT_B[0];   // URAM288.v(288)
    assign RDACCESS_A = CAS_OUT_RDACCESS_A;   // URAM288.v(289)
    assign RDACCESS_B = CAS_OUT_RDACCESS_B;   // URAM288.v(290)
    assign SBITERR_A = CAS_OUT_SBITERR_A;   // URAM288.v(291)
    assign SBITERR_B = CAS_OUT_SBITERR_B;   // URAM288.v(292)
    xor (RST_A_sync_RST_A_in_XOR_82_o, RST_A_sync, RST_A) ;   // URAM288.v(1781)
    assign RST_A_sync_RST_A_in_MUX_3249152_o = RST_A_sync_RST_A_in_XOR_82_o ? RST_A : RST_A_sync;   // URAM288.v(1781)
    xor (RST_B_sync_RST_B_in_XOR_83_o, RST_B_sync, RST_B) ;   // URAM288.v(1783)
    assign RST_B_sync_RST_B_in_MUX_3249153_o = RST_B_sync_RST_B_in_XOR_83_o ? RST_B : RST_B_sync;   // URAM288.v(1783)
    VERIFIC_DFFRS RST_B_sync_c (.d(RST_B_sync_RST_B_in_MUX_3249153_o), .clk(CLK), 
            .s(1'b0), .r(1'b0), .q(RST_B_sync));   // URAM288.v(1780)
    assign CAS_OUT_ADDR_A[22] = 1'b0;   // URAM288.v(2077)
    VERIFIC_DLATCHRS DBITERR_A_out (.d(1'bx), .gate(1'b0), .s(1'b0), .r(RST_A_async_a_sleep_OR_590626_o), 
            .q(CAS_OUT_DBITERR_A));   // URAM288.v(2354)
    assign CAS_OUT_RDACCESS_A = RST_A_async_RST_A_sync_OR_590624_o ? 1'b0 : RDACCESS_A_lat;   // URAM288.v(2341)
    or (RST_A_async_RST_A_sync_OR_590624_o, RST_A_async, RST_A_sync) ;   // URAM288.v(2355)
    or (RST_A_async_shut_down_OR_590625_o, RST_A_async_RST_A_sync_OR_590624_o, 
        shut_down) ;   // URAM288.v(2355)
    or (RST_A_async_a_sleep_OR_590626_o, RST_A_async_shut_down_OR_590625_o, 
        a_sleep) ;   // URAM288.v(2355)
    VERIFIC_DLATCHRS SBITERR_A_out (.d(1'bx), .gate(1'b0), .s(1'b0), .r(RST_A_async_a_sleep_OR_590626_o), 
            .q(CAS_OUT_SBITERR_A));   // URAM288.v(2354)
    VERIFIC_DLATCHRS data_B_enable_c (.d(1'bx), .gate(1'b0), .s(ram_ce_b_int_RDB_WR_B_int_AND_598214_o), 
            .r(1'b0), .q(data_B_enable));   // URAM288.v(2390)
    VERIFIC_DLATCHRS DBITERR_B_out (.d(1'bx), .gate(1'b0), .s(1'b0), .r(RST_B_async_a_sleep_OR_590641_o), 
            .q(CAS_OUT_DBITERR_B));   // URAM288.v(2442)
    mux_72 \GND_593371_o_ram_data_a_lat[71]_mux_21  (.d0({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .d1({ram_data_a_lat}), .cond(data_A_enable), .o({\GND_593371_o_ram_data_a_lat[71]_mux_21_OUT }));   // URAM288.v(2421)
    mux_72 GND_593371_o_GND_593371_o_mux_22 (.d0({\GND_593371_o_ram_data_a_lat[71]_mux_21_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RST_A_async_RST_A_sync_OR_590624_o), .o({CAS_OUT_DOUT_A}));   // URAM288.v(2403)
    assign CAS_OUT_RDACCESS_B = RST_B_async_RST_B_sync_OR_590639_o ? 1'b0 : RDACCESS_B_lat;   // URAM288.v(2429)
    or (RST_B_async_RST_B_sync_OR_590639_o, RST_B_async, RST_B_sync) ;   // URAM288.v(2443)
    or (RST_B_async_shut_down_OR_590640_o, RST_B_async_RST_B_sync_OR_590639_o, 
        shut_down) ;   // URAM288.v(2443)
    or (RST_B_async_a_sleep_OR_590641_o, RST_B_async_shut_down_OR_590640_o, 
        a_sleep) ;   // URAM288.v(2443)
    VERIFIC_DLATCHRS SBITERR_B_out (.d(1'bx), .gate(1'b0), .s(1'b0), .r(RST_B_async_a_sleep_OR_590641_o), 
            .q(CAS_OUT_SBITERR_B));   // URAM288.v(2442)
    wide_dffrs_1 ram_ce_a_fifo_c (.d({1'b0}), .set({1'b0}), .reset({1'b0}), 
            .clock(CLK), .q({ram_ce_a_fifo[3]}));   // URAM288.v(2647)
    mux_72 \GND_593371_o_ram_data_b_lat[71]_mux_23  (.d0({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .d1({ram_data_b_lat}), .cond(data_B_enable), .o({\GND_593371_o_ram_data_b_lat[71]_mux_23_OUT }));   // URAM288.v(2486)
    mux_72 GND_593371_o_GND_593371_o_mux_24 (.d0({\GND_593371_o_ram_data_b_lat[71]_mux_23_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RST_B_async_RST_B_sync_OR_590639_o), .o({CAS_OUT_DOUT_B}));   // URAM288.v(2468)
    wide_dffrs_1 ram_ce_b_fifo_c (.d({1'b0}), .set({1'b0}), .reset({1'b0}), 
            .clock(CLK), .q({ram_ce_b_fifo[3]}));   // URAM288.v(2668)
    xor_11 \ADDR_A_int[22]_GND_593371_o_xor_37  (.a({ADDR_A[22:12]}), .b({11'b00000000000}), 
           .o({\ADDR_A_int[22]_GND_593371_o_xor_37_OUT }));   // URAM288.v(2657)
    inv_11 \ADDR_A_int[22]_inv_38  (.i({\ADDR_A_int[22]_GND_593371_o_xor_37_OUT }), 
           .o({\ADDR_A_int[22]_inv_38_OUT }));   // URAM288.v(2657)
    or_11 \ADDR_A_int[22]_GND_593371_o_or_39  (.a({\ADDR_A_int[22]_inv_38_OUT }), 
          .b({11'b00000000000}), .o({\ADDR_A_int[22]_GND_593371_o_or_39_OUT }));   // URAM288.v(2657)
    and (\ADDR_A_int[22]_reduce_and_41_o , \ADDR_A_int[22]_GND_593371_o_or_39_OUT [10], 
          \ADDR_A_int[22]_GND_593371_o_or_39_OUT [9], \ADDR_A_int[22]_GND_593371_o_or_39_OUT [8], 
          \ADDR_A_int[22]_GND_593371_o_or_39_OUT [7], \ADDR_A_int[22]_GND_593371_o_or_39_OUT [6], 
          \ADDR_A_int[22]_GND_593371_o_or_39_OUT [5], \ADDR_A_int[22]_GND_593371_o_or_39_OUT [4], 
          \ADDR_A_int[22]_GND_593371_o_or_39_OUT [3], \ADDR_A_int[22]_GND_593371_o_or_39_OUT [2], 
          \ADDR_A_int[22]_GND_593371_o_or_39_OUT [1], \ADDR_A_int[22]_GND_593371_o_or_39_OUT [0]) ;   // URAM288.v(2657)
    and (ram_ce_a, \ADDR_A_int[22]_reduce_and_41_o , EN_A) ;   // URAM288.v(2657)
    wide_dffrs_72 ram_bwe_a_c (.d({\ram_bwe_a[71]_GND_593371_o_mux_53_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK), .q({ram_bwe_a}));   // URAM288.v(2684)
    xor_11 \ADDR_B_int[22]_GND_593371_o_xor_47  (.a({ADDR_B[22:12]}), .b({11'b00000000000}), 
           .o({\ADDR_B_int[22]_GND_593371_o_xor_47_OUT }));   // URAM288.v(2678)
    inv_11 \ADDR_B_int[22]_inv_48  (.i({\ADDR_B_int[22]_GND_593371_o_xor_47_OUT }), 
           .o({\ADDR_B_int[22]_inv_48_OUT }));   // URAM288.v(2678)
    or_11 \ADDR_B_int[22]_GND_593371_o_or_49  (.a({\ADDR_B_int[22]_inv_48_OUT }), 
          .b({11'b00000000000}), .o({\ADDR_B_int[22]_GND_593371_o_or_49_OUT }));   // URAM288.v(2678)
    and (\ADDR_B_int[22]_reduce_and_51_o , \ADDR_B_int[22]_GND_593371_o_or_49_OUT [10], 
          \ADDR_B_int[22]_GND_593371_o_or_49_OUT [9], \ADDR_B_int[22]_GND_593371_o_or_49_OUT [8], 
          \ADDR_B_int[22]_GND_593371_o_or_49_OUT [7], \ADDR_B_int[22]_GND_593371_o_or_49_OUT [6], 
          \ADDR_B_int[22]_GND_593371_o_or_49_OUT [5], \ADDR_B_int[22]_GND_593371_o_or_49_OUT [4], 
          \ADDR_B_int[22]_GND_593371_o_or_49_OUT [3], \ADDR_B_int[22]_GND_593371_o_or_49_OUT [2], 
          \ADDR_B_int[22]_GND_593371_o_or_49_OUT [1], \ADDR_B_int[22]_GND_593371_o_or_49_OUT [0]) ;   // URAM288.v(2678)
    and (ram_ce_b, \ADDR_B_int[22]_reduce_and_51_o , EN_B) ;   // URAM288.v(2678)
    or (RDB_WR_A_int_a_sleep_OR_590651_o, RDB_WR_A_int_INV_283_o, a_sleep) ;   // URAM288.v(2685)
    or (RDB_WR_A_int_SLEEP_in_OR_590652_o, RDB_WR_A_int_a_sleep_OR_590651_o, 
        SLEEP) ;   // URAM288.v(2685)
    or (RDB_WR_A_int_auto_sleep_OR_590653_o, RDB_WR_A_int_SLEEP_in_OR_590652_o, 
        auto_sleep) ;   // URAM288.v(2685)
    or (RDB_WR_A_int_shut_down_OR_590654_o, RDB_WR_A_int_auto_sleep_OR_590653_o, 
        shut_down) ;   // URAM288.v(2685)
    or (RDB_WR_A_int_SHUTDOWN_in_OR_590655_o, RDB_WR_A_int_shut_down_OR_590654_o, 
        SHUTDOWN) ;   // URAM288.v(2685)
    mux_72 \ram_bwe_a[71]_BWE_A_int[7]_mux_52  (.d0({ram_bwe_a}), .d1({BWE_A[7:0], 
           BWE_A[7], BWE_A[7], BWE_A[7], BWE_A[7], BWE_A[7], BWE_A[7], 
           BWE_A[7], BWE_A[7:6], BWE_A[6], BWE_A[6], BWE_A[6], BWE_A[6], 
           BWE_A[6], BWE_A[6], BWE_A[6:5], BWE_A[5], BWE_A[5], BWE_A[5], 
           BWE_A[5], BWE_A[5], BWE_A[5], BWE_A[5:4], BWE_A[4], BWE_A[4], 
           BWE_A[4], BWE_A[4], BWE_A[4], BWE_A[4], BWE_A[4:3], BWE_A[3], 
           BWE_A[3], BWE_A[3], BWE_A[3], BWE_A[3], BWE_A[3], BWE_A[3:2], 
           BWE_A[2], BWE_A[2], BWE_A[2], BWE_A[2], BWE_A[2], BWE_A[2], 
           BWE_A[2:1], BWE_A[1], BWE_A[1], BWE_A[1], BWE_A[1], BWE_A[1], 
           BWE_A[1], BWE_A[1:0], BWE_A[0], BWE_A[0], BWE_A[0], BWE_A[0], 
           BWE_A[0], BWE_A[0], BWE_A[0]}), .cond(ram_ce_a), .o({\ram_bwe_a[71]_BWE_A_int[7]_mux_52_OUT }));   // URAM288.v(2687)
    mux_72 \ram_bwe_a[71]_GND_593371_o_mux_53  (.d0({\ram_bwe_a[71]_BWE_A_int[7]_mux_52_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RDB_WR_A_int_SHUTDOWN_in_OR_590655_o), .o({\ram_bwe_a[71]_GND_593371_o_mux_53_OUT }));   // URAM288.v(2687)
    wide_dffrs_72 ram_bwe_b_c (.d({\ram_bwe_b[71]_GND_593371_o_mux_57_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK), .q({ram_bwe_b}));   // URAM288.v(2702)
    or (RDB_WR_B_int_a_sleep_OR_590656_o, RDB_WR_B_int_INV_285_o, a_sleep) ;   // URAM288.v(2703)
    or (RDB_WR_B_int_SLEEP_in_OR_590657_o, RDB_WR_B_int_a_sleep_OR_590656_o, 
        SLEEP) ;   // URAM288.v(2703)
    or (RDB_WR_B_int_auto_sleep_OR_590658_o, RDB_WR_B_int_SLEEP_in_OR_590657_o, 
        auto_sleep) ;   // URAM288.v(2703)
    or (RDB_WR_B_int_shut_down_OR_590659_o, RDB_WR_B_int_auto_sleep_OR_590658_o, 
        shut_down) ;   // URAM288.v(2703)
    or (RDB_WR_B_int_SHUTDOWN_in_OR_590660_o, RDB_WR_B_int_shut_down_OR_590659_o, 
        SHUTDOWN) ;   // URAM288.v(2703)
    mux_72 \ram_bwe_b[71]_BWE_B_int[7]_mux_56  (.d0({ram_bwe_b}), .d1({BWE_B[7:0], 
           BWE_B[7], BWE_B[7], BWE_B[7], BWE_B[7], BWE_B[7], BWE_B[7], 
           BWE_B[7], BWE_B[7:6], BWE_B[6], BWE_B[6], BWE_B[6], BWE_B[6], 
           BWE_B[6], BWE_B[6], BWE_B[6:5], BWE_B[5], BWE_B[5], BWE_B[5], 
           BWE_B[5], BWE_B[5], BWE_B[5], BWE_B[5:4], BWE_B[4], BWE_B[4], 
           BWE_B[4], BWE_B[4], BWE_B[4], BWE_B[4], BWE_B[4:3], BWE_B[3], 
           BWE_B[3], BWE_B[3], BWE_B[3], BWE_B[3], BWE_B[3], BWE_B[3:2], 
           BWE_B[2], BWE_B[2], BWE_B[2], BWE_B[2], BWE_B[2], BWE_B[2], 
           BWE_B[2:1], BWE_B[1], BWE_B[1], BWE_B[1], BWE_B[1], BWE_B[1], 
           BWE_B[1], BWE_B[1:0], BWE_B[0], BWE_B[0], BWE_B[0], BWE_B[0], 
           BWE_B[0], BWE_B[0], BWE_B[0]}), .cond(ram_ce_b), .o({\ram_bwe_b[71]_BWE_B_int[7]_mux_56_OUT }));   // URAM288.v(2705)
    mux_72 \ram_bwe_b[71]_GND_593371_o_mux_57  (.d0({\ram_bwe_b[71]_BWE_B_int[7]_mux_56_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RDB_WR_B_int_SHUTDOWN_in_OR_590660_o), .o({\ram_bwe_b[71]_GND_593371_o_mux_57_OUT }));   // URAM288.v(2705)
    wide_dffrs_12 ram_addr_a_c (.d({\ram_addr_a[11]_GND_593371_o_mux_61_OUT }), 
            .set({12'b000000000000}), .reset({12'b000000000000}), .clock(CLK), 
            .q({ram_addr_a}));   // URAM288.v(2721)
    or (a_sleep_SLEEP_in_OR_590661_o, a_sleep, SLEEP) ;   // URAM288.v(2722)
    or (a_sleep_auto_sleep_OR_590662_o, a_sleep_SLEEP_in_OR_590661_o, auto_sleep) ;   // URAM288.v(2722)
    or (a_sleep_shut_down_OR_590663_o, a_sleep_auto_sleep_OR_590662_o, shut_down) ;   // URAM288.v(2722)
    or (a_sleep_SHUTDOWN_in_OR_590664_o, a_sleep_shut_down_OR_590663_o, 
        SHUTDOWN) ;   // URAM288.v(2722)
    mux_12 \ram_addr_a[11]_ADDR_A_int[11]_mux_60  (.d0({ram_addr_a}), .d1({ADDR_A[11:0]}), 
           .cond(ram_ce_a), .o({\ram_addr_a[11]_ADDR_A_int[11]_mux_60_OUT }));   // URAM288.v(2724)
    mux_12 \ram_addr_a[11]_GND_593371_o_mux_61  (.d0({\ram_addr_a[11]_ADDR_A_int[11]_mux_60_OUT }), 
           .d1({12'b000000000000}), .cond(a_sleep_SHUTDOWN_in_OR_590664_o), 
           .o({\ram_addr_a[11]_GND_593371_o_mux_61_OUT }));   // URAM288.v(2724)
    wide_dffrs_12 ram_addr_b_c (.d({\ram_addr_b[11]_GND_593371_o_mux_65_OUT }), 
            .set({12'b000000000000}), .reset({12'b000000000000}), .clock(CLK), 
            .q({ram_addr_b}));   // URAM288.v(2729)
    mux_12 \ram_addr_b[11]_ADDR_B_int[11]_mux_64  (.d0({ram_addr_b}), .d1({ADDR_B[11:0]}), 
           .cond(ram_ce_b), .o({\ram_addr_b[11]_ADDR_B_int[11]_mux_64_OUT }));   // URAM288.v(2732)
    mux_12 \ram_addr_b[11]_GND_593371_o_mux_65  (.d0({\ram_addr_b[11]_ADDR_B_int[11]_mux_64_OUT }), 
           .d1({12'b000000000000}), .cond(a_sleep_SHUTDOWN_in_OR_590664_o), 
           .o({\ram_addr_b[11]_GND_593371_o_mux_65_OUT }));   // URAM288.v(2732)
    VERIFIC_DFFRS ram_we_a_c (.d(RDB_WR_A_int_GND_593371_o_MUX_3249221_o), 
            .clk(CLK), .s(1'b0), .r(1'b0), .q(ram_we_a));   // URAM288.v(2753)
    not (ram_ce_a_int_INV_278_o, ram_ce_a) ;   // URAM288.v(2754)
    or (a_sleep_ram_ce_a_int_OR_590683_o, a_sleep_SHUTDOWN_in_OR_590664_o, 
        ram_ce_a_int_INV_278_o) ;   // URAM288.v(2754)
    assign RDB_WR_A_int_GND_593371_o_MUX_3249221_o = a_sleep_ram_ce_a_int_OR_590683_o ? 1'b0 : RDB_WR_A;   // URAM288.v(2756)
    VERIFIC_DFFRS ram_we_b_c (.d(RDB_WR_B_int_GND_593371_o_MUX_3249224_o), 
            .clk(CLK), .s(1'b0), .r(1'b0), .q(ram_we_b));   // URAM288.v(2762)
    not (ram_ce_b_int_INV_280_o, ram_ce_b) ;   // URAM288.v(2763)
    or (a_sleep_ram_ce_b_int_OR_590688_o, a_sleep_SHUTDOWN_in_OR_590664_o, 
        ram_ce_b_int_INV_280_o) ;   // URAM288.v(2763)
    assign RDB_WR_B_int_GND_593371_o_MUX_3249224_o = a_sleep_ram_ce_b_int_OR_590688_o ? 1'b0 : RDB_WR_B;   // URAM288.v(2765)
    wide_dffrs_72 ram_data_a_c (.d({\ram_data_a[71]_GND_593371_o_mux_73_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK), .q({ram_data_a}));   // URAM288.v(2771)
    and (RDB_WR_A_int_ram_ce_a_int_AND_598211_o, RDB_WR_A, ram_ce_a) ;   // URAM288.v(2774)
    mux_72 \ram_data_a[71]_DIN_A_int[71]_mux_72  (.d0({ram_data_a}), .d1({DIN_A}), 
           .cond(RDB_WR_A_int_ram_ce_a_int_AND_598211_o), .o({\ram_data_a[71]_DIN_A_int[71]_mux_72_OUT }));   // URAM288.v(2774)
    mux_72 \ram_data_a[71]_GND_593371_o_mux_73  (.d0({\ram_data_a[71]_DIN_A_int[71]_mux_72_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(a_sleep_SHUTDOWN_in_OR_590664_o), .o({\ram_data_a[71]_GND_593371_o_mux_73_OUT }));   // URAM288.v(2774)
    wide_dffrs_72 ram_data_b_c (.d({\ram_data_b[71]_GND_593371_o_mux_77_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK), .q({ram_data_b}));   // URAM288.v(2795)
    and (RDB_WR_B_int_ram_ce_b_int_AND_598212_o, RDB_WR_B, ram_ce_b) ;   // URAM288.v(2798)
    mux_72 \ram_data_b[71]_DIN_B_int[71]_mux_76  (.d0({ram_data_b}), .d1({DIN_B}), 
           .cond(RDB_WR_B_int_ram_ce_b_int_AND_598212_o), .o({\ram_data_b[71]_DIN_B_int[71]_mux_76_OUT }));   // URAM288.v(2798)
    mux_72 \ram_data_b[71]_GND_593371_o_mux_77  (.d0({\ram_data_b[71]_DIN_B_int[71]_mux_76_OUT }), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(a_sleep_SHUTDOWN_in_OR_590664_o), .o({\ram_data_b[71]_GND_593371_o_mux_77_OUT }));   // URAM288.v(2798)
    wide_dffrs_72 ram_data_a_out_c (.d({\ram_data_a_out[71]_ram_addr_a[11]_mux_88_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK_in_INV_286_o), .q({ram_data_a_lat}));   // URAM288.v(2881)
    or (auto_sleep_SHUTDOWN_in_OR_590697_o, auto_sleep, SHUTDOWN) ;   // URAM288.v(2821)
    not (RDB_WR_A_int_INV_283_o, RDB_WR_A) ;   // URAM288.v(2825)
    and (ram_ce_a_int_RDB_WR_A_int_AND_598213_o, ram_ce_a, RDB_WR_A_int_INV_283_o) ;   // URAM288.v(2825)
    assign RDACCESS_A_lat = auto_sleep_SHUTDOWN_in_OR_590697_o ? 1'b0 : ram_ce_a_int_RDB_WR_A_int_AND_598213_o;   // URAM288.v(2825)
    not (RDB_WR_B_int_INV_285_o, RDB_WR_B) ;   // URAM288.v(2837)
    and (ram_ce_b_int_RDB_WR_B_int_AND_598214_o, ram_ce_b, RDB_WR_B_int_INV_285_o) ;   // URAM288.v(2837)
    assign RDACCESS_B_lat = auto_sleep_SHUTDOWN_in_OR_590697_o ? 1'b0 : ram_ce_b_int_RDB_WR_B_int_AND_598214_o;   // URAM288.v(2837)
    not (CLK_in_INV_286_o, CLK) ;   // URAM288.v(2881)
    mux_72 \ram_data_a_out[71]_GND_593371_o_mux_80  (.d0({ram_data_a_lat}), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RST_A_async_shut_down_OR_590625_o), .o({\ram_data_a_out[71]_GND_593371_o_mux_80_OUT }));   // URAM288.v(2882)
    not (shut_down_INV_287_o, shut_down) ;   // URAM288.v(2885)
    and (ram_we_a_shut_down_AND_598215_o, ram_we_a, shut_down_INV_287_o) ;   // URAM288.v(2885)
    not (a_sleep_INV_288_o, a_sleep) ;   // URAM288.v(2885)
    and (ram_we_a_a_sleep_AND_598216_o, ram_we_a_shut_down_AND_598215_o, 
        a_sleep_INV_288_o) ;   // URAM288.v(2885)
    and_72 \ram_data_a[71]_ram_bwe_a[71]_and_81  (.a({ram_data_a}), .b({ram_bwe_a}), 
           .o({\ram_data_a[71]_ram_bwe_a[71]_and_81_OUT }));   // URAM288.v(2886)
    ReadPort_12_72_0_4095_71_0 \ram_addr_a[11]_read_port_82  (.read_enable(1'b1), 
            .read_address({ram_addr_a}), .read_data({\ram_addr_a[11]_read_port_82_OUT }), 
            .Ram(mem));   // URAM288.v(2886)
    inv_72 \ram_bwe_a[71]_inv_83  (.i({ram_bwe_a}), .o({\ram_bwe_a[71]_inv_83_OUT }));   // URAM288.v(2886)
    and_72 \ram_addr_a[11]_ram_bwe_a[71]_and_84  (.a({\ram_addr_a[11]_read_port_82_OUT }), 
           .b({\ram_bwe_a[71]_inv_83_OUT }), .o({\ram_addr_a[11]_ram_bwe_a[71]_and_84_OUT }));   // URAM288.v(2886)
    or_72 \ram_data_a[71]_ram_addr_a[11]_or_85  (.a({\ram_data_a[71]_ram_bwe_a[71]_and_81_OUT }), 
          .b({\ram_addr_a[11]_ram_bwe_a[71]_and_84_OUT }), .o({\ram_data_a[71]_ram_addr_a[11]_or_85_OUT }));   // URAM288.v(2886)
    always @(posedge CLK_in_INV_286_o)  begin
        
        if (ram_we_a_a_sleep_AND_598216_o) mem[-({ ram_addr_a[11], ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], ram_addr_a[2], ram_addr_a[1], ram_addr_a[0] } - (4095))*72 +: 72] <= {\ram_data_a[71]_ram_addr_a[11]_or_85_OUT } ;
        if (ram_we_b_a_sleep_AND_598222_o) mem[-({ ram_addr_b[11], ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], ram_addr_b[2], ram_addr_b[1], ram_addr_b[0] } - (4095))*72 +: 72] <= {\ram_data_b[71]_ram_addr_b[11]_or_94_OUT } ;
        
    end
    not (ram_we_a_INV_289_o, ram_we_a) ;   // URAM288.v(2889)
    and (ram_ce_a_ram_we_a_AND_598217_o, ram_ce_a, ram_we_a_INV_289_o) ;   // URAM288.v(2889)
    not (RST_A_in_INV_290_o, RST_A) ;   // URAM288.v(2889)
    and (ram_ce_a_RST_A_in_AND_598218_o, ram_ce_a_ram_we_a_AND_598217_o, 
        RST_A_in_INV_290_o) ;   // URAM288.v(2889)
    and (ram_ce_a_shut_down_AND_598219_o, ram_ce_a_RST_A_in_AND_598218_o, 
        shut_down_INV_287_o) ;   // URAM288.v(2889)
    and (ram_ce_a_a_sleep_AND_598220_o, ram_ce_a_shut_down_AND_598219_o, 
        a_sleep_INV_288_o) ;   // URAM288.v(2889)
    
    ReadPort_12_72_0_4095_71_0 \ram_addr_a[11]_read_port_87  (.read_enable(1'b1), 
            .read_address({ram_addr_a}), .Ram(mem), .read_data( { \ram_addr_a[11]_read_port_87_read_data[71]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[70]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[69]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[68]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[67]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[66]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[65]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[64]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[63]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[62]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[61]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[60]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[59]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[58]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[57]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[56]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[55]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[54]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[53]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[52]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[51]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[50]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[49]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[48]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[47]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[46]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[45]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[44]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[43]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[42]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[41]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[40]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[39]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[38]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[37]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[36]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[35]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[34]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[33]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[32]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[31]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[30]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[29]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[28]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[27]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[26]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[25]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[24]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[23]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[22]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[21]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[20]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[19]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[18]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[17]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[16]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[15]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[14]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[13]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[12]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[11]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[10]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[9]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[8]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[7]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[6]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[5]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[4]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[3]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[2]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[1]_temp_read_port_ram_value , 
            \ram_addr_a[11]_read_port_87_read_data[0]_temp_read_port_ram_value  } ));   // URAM288.v(2890)
    assign \ram_addr_a[11]_read_port_87_OUT [71] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [71] : \ram_addr_a[11]_read_port_87_read_data[71]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [70] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [70] : \ram_addr_a[11]_read_port_87_read_data[70]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [69] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [69] : \ram_addr_a[11]_read_port_87_read_data[69]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [68] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [68] : \ram_addr_a[11]_read_port_87_read_data[68]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [67] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [67] : \ram_addr_a[11]_read_port_87_read_data[67]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [66] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [66] : \ram_addr_a[11]_read_port_87_read_data[66]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [65] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [65] : \ram_addr_a[11]_read_port_87_read_data[65]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [64] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [64] : \ram_addr_a[11]_read_port_87_read_data[64]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [63] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [63] : \ram_addr_a[11]_read_port_87_read_data[63]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [62] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [62] : \ram_addr_a[11]_read_port_87_read_data[62]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [61] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [61] : \ram_addr_a[11]_read_port_87_read_data[61]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [60] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [60] : \ram_addr_a[11]_read_port_87_read_data[60]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [59] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [59] : \ram_addr_a[11]_read_port_87_read_data[59]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [58] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [58] : \ram_addr_a[11]_read_port_87_read_data[58]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [57] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [57] : \ram_addr_a[11]_read_port_87_read_data[57]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [56] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [56] : \ram_addr_a[11]_read_port_87_read_data[56]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [55] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [55] : \ram_addr_a[11]_read_port_87_read_data[55]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [54] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [54] : \ram_addr_a[11]_read_port_87_read_data[54]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [53] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [53] : \ram_addr_a[11]_read_port_87_read_data[53]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [52] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [52] : \ram_addr_a[11]_read_port_87_read_data[52]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [51] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [51] : \ram_addr_a[11]_read_port_87_read_data[51]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [50] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [50] : \ram_addr_a[11]_read_port_87_read_data[50]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [49] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [49] : \ram_addr_a[11]_read_port_87_read_data[49]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [48] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [48] : \ram_addr_a[11]_read_port_87_read_data[48]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [47] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [47] : \ram_addr_a[11]_read_port_87_read_data[47]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [46] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [46] : \ram_addr_a[11]_read_port_87_read_data[46]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [45] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [45] : \ram_addr_a[11]_read_port_87_read_data[45]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [44] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [44] : \ram_addr_a[11]_read_port_87_read_data[44]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [43] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [43] : \ram_addr_a[11]_read_port_87_read_data[43]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [42] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [42] : \ram_addr_a[11]_read_port_87_read_data[42]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [41] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [41] : \ram_addr_a[11]_read_port_87_read_data[41]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [40] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [40] : \ram_addr_a[11]_read_port_87_read_data[40]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [39] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [39] : \ram_addr_a[11]_read_port_87_read_data[39]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [38] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [38] : \ram_addr_a[11]_read_port_87_read_data[38]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [37] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [37] : \ram_addr_a[11]_read_port_87_read_data[37]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [36] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [36] : \ram_addr_a[11]_read_port_87_read_data[36]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [35] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [35] : \ram_addr_a[11]_read_port_87_read_data[35]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [34] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [34] : \ram_addr_a[11]_read_port_87_read_data[34]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [33] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [33] : \ram_addr_a[11]_read_port_87_read_data[33]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [32] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [32] : \ram_addr_a[11]_read_port_87_read_data[32]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [31] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [31] : \ram_addr_a[11]_read_port_87_read_data[31]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [30] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [30] : \ram_addr_a[11]_read_port_87_read_data[30]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [29] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [29] : \ram_addr_a[11]_read_port_87_read_data[29]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [28] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [28] : \ram_addr_a[11]_read_port_87_read_data[28]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [27] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [27] : \ram_addr_a[11]_read_port_87_read_data[27]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [26] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [26] : \ram_addr_a[11]_read_port_87_read_data[26]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [25] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [25] : \ram_addr_a[11]_read_port_87_read_data[25]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [24] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [24] : \ram_addr_a[11]_read_port_87_read_data[24]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [23] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [23] : \ram_addr_a[11]_read_port_87_read_data[23]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [22] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [22] : \ram_addr_a[11]_read_port_87_read_data[22]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [21] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [21] : \ram_addr_a[11]_read_port_87_read_data[21]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [20] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [20] : \ram_addr_a[11]_read_port_87_read_data[20]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [19] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [19] : \ram_addr_a[11]_read_port_87_read_data[19]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [18] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [18] : \ram_addr_a[11]_read_port_87_read_data[18]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [17] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [17] : \ram_addr_a[11]_read_port_87_read_data[17]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [16] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [16] : \ram_addr_a[11]_read_port_87_read_data[16]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [15] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [15] : \ram_addr_a[11]_read_port_87_read_data[15]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [14] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [14] : \ram_addr_a[11]_read_port_87_read_data[14]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [13] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [13] : \ram_addr_a[11]_read_port_87_read_data[13]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [12] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [12] : \ram_addr_a[11]_read_port_87_read_data[12]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [11] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [11] : \ram_addr_a[11]_read_port_87_read_data[11]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [10] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [10] : \ram_addr_a[11]_read_port_87_read_data[10]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [9] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [9] : \ram_addr_a[11]_read_port_87_read_data[9]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [8] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [8] : \ram_addr_a[11]_read_port_87_read_data[8]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [7] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [7] : \ram_addr_a[11]_read_port_87_read_data[7]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [6] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [6] : \ram_addr_a[11]_read_port_87_read_data[6]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [5] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [5] : \ram_addr_a[11]_read_port_87_read_data[5]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [4] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [4] : \ram_addr_a[11]_read_port_87_read_data[4]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [3] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [3] : \ram_addr_a[11]_read_port_87_read_data[3]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [2] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [2] : \ram_addr_a[11]_read_port_87_read_data[2]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [1] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [1] : \ram_addr_a[11]_read_port_87_read_data[1]_temp_read_port_ram_value  ;
    assign \ram_addr_a[11]_read_port_87_OUT [0] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [0] : \ram_addr_a[11]_read_port_87_read_data[0]_temp_read_port_ram_value  ;
    mux_72 \ram_data_a_out[71]_ram_addr_a[11]_mux_88  (.d0({\ram_data_a_out[71]_GND_593371_o_mux_80_OUT }), 
            .d1({\ram_addr_a[11]_read_port_87_OUT }), .cond(ram_ce_a_a_sleep_AND_598220_o), 
            .o({\ram_data_a_out[71]_ram_addr_a[11]_mux_88_OUT }));   // URAM288.v(2889)
    mux_72 \ram_data_b_out[71]_GND_593371_o_mux_89  (.d0({ram_data_b_lat}), 
           .d1({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
           .cond(RST_B_async_shut_down_OR_590640_o), .o({\ram_data_b_out[71]_GND_593371_o_mux_89_OUT }));   // URAM288.v(2893)
    and (ram_we_b_shut_down_AND_598221_o, ram_we_b, shut_down_INV_287_o) ;   // URAM288.v(2896)
    and (ram_we_b_a_sleep_AND_598222_o, ram_we_b_shut_down_AND_598221_o, 
        a_sleep_INV_288_o) ;   // URAM288.v(2896)
    and_72 \ram_data_b[71]_ram_bwe_b[71]_and_90  (.a({ram_data_b}), .b({ram_bwe_b}), 
           .o({\ram_data_b[71]_ram_bwe_b[71]_and_90_OUT }));   // URAM288.v(2897)
    
    ReadPort_12_72_0_4095_71_0 \ram_addr_b[11]_read_port_91  (.read_enable(1'b1), 
            .read_address({ram_addr_b}), .Ram(mem), .read_data( { \ram_addr_b[11]_read_port_91_read_data[71]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[70]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[69]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[68]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[67]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[66]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[65]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[64]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[63]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[62]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[61]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[60]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[59]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[58]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[57]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[56]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[55]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[54]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[53]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[52]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[51]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[50]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[49]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[48]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[47]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[46]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[45]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[44]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[43]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[42]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[41]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[40]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[39]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[38]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[37]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[36]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[35]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[34]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[33]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[32]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[31]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[30]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[29]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[28]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[27]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[26]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[25]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[24]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[23]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[22]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[21]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[20]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[19]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[18]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[17]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[16]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[15]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[14]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[13]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[12]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[11]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[10]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[9]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[8]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[7]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[6]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[5]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[4]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[3]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[2]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[1]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_91_read_data[0]_temp_read_port_ram_value  } ));   // URAM288.v(2897)
    assign \ram_addr_b[11]_read_port_91_OUT [71] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [71] : \ram_addr_b[11]_read_port_91_read_data[71]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [70] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [70] : \ram_addr_b[11]_read_port_91_read_data[70]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [69] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [69] : \ram_addr_b[11]_read_port_91_read_data[69]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [68] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [68] : \ram_addr_b[11]_read_port_91_read_data[68]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [67] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [67] : \ram_addr_b[11]_read_port_91_read_data[67]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [66] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [66] : \ram_addr_b[11]_read_port_91_read_data[66]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [65] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [65] : \ram_addr_b[11]_read_port_91_read_data[65]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [64] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [64] : \ram_addr_b[11]_read_port_91_read_data[64]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [63] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [63] : \ram_addr_b[11]_read_port_91_read_data[63]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [62] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [62] : \ram_addr_b[11]_read_port_91_read_data[62]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [61] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [61] : \ram_addr_b[11]_read_port_91_read_data[61]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [60] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [60] : \ram_addr_b[11]_read_port_91_read_data[60]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [59] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [59] : \ram_addr_b[11]_read_port_91_read_data[59]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [58] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [58] : \ram_addr_b[11]_read_port_91_read_data[58]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [57] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [57] : \ram_addr_b[11]_read_port_91_read_data[57]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [56] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [56] : \ram_addr_b[11]_read_port_91_read_data[56]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [55] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [55] : \ram_addr_b[11]_read_port_91_read_data[55]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [54] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [54] : \ram_addr_b[11]_read_port_91_read_data[54]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [53] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [53] : \ram_addr_b[11]_read_port_91_read_data[53]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [52] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [52] : \ram_addr_b[11]_read_port_91_read_data[52]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [51] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [51] : \ram_addr_b[11]_read_port_91_read_data[51]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [50] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [50] : \ram_addr_b[11]_read_port_91_read_data[50]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [49] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [49] : \ram_addr_b[11]_read_port_91_read_data[49]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [48] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [48] : \ram_addr_b[11]_read_port_91_read_data[48]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [47] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [47] : \ram_addr_b[11]_read_port_91_read_data[47]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [46] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [46] : \ram_addr_b[11]_read_port_91_read_data[46]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [45] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [45] : \ram_addr_b[11]_read_port_91_read_data[45]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [44] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [44] : \ram_addr_b[11]_read_port_91_read_data[44]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [43] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [43] : \ram_addr_b[11]_read_port_91_read_data[43]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [42] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [42] : \ram_addr_b[11]_read_port_91_read_data[42]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [41] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [41] : \ram_addr_b[11]_read_port_91_read_data[41]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [40] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [40] : \ram_addr_b[11]_read_port_91_read_data[40]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [39] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [39] : \ram_addr_b[11]_read_port_91_read_data[39]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [38] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [38] : \ram_addr_b[11]_read_port_91_read_data[38]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [37] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [37] : \ram_addr_b[11]_read_port_91_read_data[37]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [36] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [36] : \ram_addr_b[11]_read_port_91_read_data[36]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [35] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [35] : \ram_addr_b[11]_read_port_91_read_data[35]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [34] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [34] : \ram_addr_b[11]_read_port_91_read_data[34]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [33] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [33] : \ram_addr_b[11]_read_port_91_read_data[33]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [32] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [32] : \ram_addr_b[11]_read_port_91_read_data[32]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [31] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [31] : \ram_addr_b[11]_read_port_91_read_data[31]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [30] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [30] : \ram_addr_b[11]_read_port_91_read_data[30]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [29] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [29] : \ram_addr_b[11]_read_port_91_read_data[29]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [28] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [28] : \ram_addr_b[11]_read_port_91_read_data[28]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [27] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [27] : \ram_addr_b[11]_read_port_91_read_data[27]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [26] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [26] : \ram_addr_b[11]_read_port_91_read_data[26]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [25] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [25] : \ram_addr_b[11]_read_port_91_read_data[25]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [24] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [24] : \ram_addr_b[11]_read_port_91_read_data[24]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [23] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [23] : \ram_addr_b[11]_read_port_91_read_data[23]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [22] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [22] : \ram_addr_b[11]_read_port_91_read_data[22]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [21] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [21] : \ram_addr_b[11]_read_port_91_read_data[21]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [20] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [20] : \ram_addr_b[11]_read_port_91_read_data[20]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [19] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [19] : \ram_addr_b[11]_read_port_91_read_data[19]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [18] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [18] : \ram_addr_b[11]_read_port_91_read_data[18]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [17] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [17] : \ram_addr_b[11]_read_port_91_read_data[17]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [16] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [16] : \ram_addr_b[11]_read_port_91_read_data[16]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [15] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [15] : \ram_addr_b[11]_read_port_91_read_data[15]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [14] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [14] : \ram_addr_b[11]_read_port_91_read_data[14]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [13] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [13] : \ram_addr_b[11]_read_port_91_read_data[13]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [12] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [12] : \ram_addr_b[11]_read_port_91_read_data[12]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [11] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [11] : \ram_addr_b[11]_read_port_91_read_data[11]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [10] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [10] : \ram_addr_b[11]_read_port_91_read_data[10]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [9] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [9] : \ram_addr_b[11]_read_port_91_read_data[9]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [8] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [8] : \ram_addr_b[11]_read_port_91_read_data[8]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [7] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [7] : \ram_addr_b[11]_read_port_91_read_data[7]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [6] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [6] : \ram_addr_b[11]_read_port_91_read_data[6]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [5] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [5] : \ram_addr_b[11]_read_port_91_read_data[5]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [4] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [4] : \ram_addr_b[11]_read_port_91_read_data[4]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [3] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [3] : \ram_addr_b[11]_read_port_91_read_data[3]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [2] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [2] : \ram_addr_b[11]_read_port_91_read_data[2]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [1] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [1] : \ram_addr_b[11]_read_port_91_read_data[1]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_91_OUT [0] =  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
           ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
           ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
           ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
           ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
           ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
           ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [0] : \ram_addr_b[11]_read_port_91_read_data[0]_temp_read_port_ram_value  ;
    inv_72 \ram_bwe_b[71]_inv_92  (.i({ram_bwe_b}), 
            .o({\ram_bwe_b[71]_inv_92_OUT }));   // URAM288.v(2897)
    and_72 \ram_addr_b[11]_ram_bwe_b[71]_and_93  (.a({\ram_addr_b[11]_read_port_91_OUT }), 
           .b({\ram_bwe_b[71]_inv_92_OUT }), .o({\ram_addr_b[11]_ram_bwe_b[71]_and_93_OUT }));   // URAM288.v(2897)
    or_72 \ram_data_b[71]_ram_addr_b[11]_or_94  (.a({\ram_data_b[71]_ram_bwe_b[71]_and_90_OUT }), 
          .b({\ram_addr_b[11]_ram_bwe_b[71]_and_93_OUT }), .o({\ram_data_b[71]_ram_addr_b[11]_or_94_OUT }));   // URAM288.v(2897)
    not (ram_we_b_INV_295_o, ram_we_b) ;   // URAM288.v(2900)
    and (ram_ce_b_ram_we_b_AND_598223_o, ram_ce_b, ram_we_b_INV_295_o) ;   // URAM288.v(2900)
    not (RST_B_in_INV_296_o, RST_B) ;   // URAM288.v(2900)
    and (ram_ce_b_RST_B_in_AND_598224_o, ram_ce_b_ram_we_b_AND_598223_o, 
        RST_B_in_INV_296_o) ;   // URAM288.v(2900)
    and (ram_ce_b_shut_down_AND_598225_o, ram_ce_b_RST_B_in_AND_598224_o, 
        shut_down_INV_287_o) ;   // URAM288.v(2900)
    and (ram_ce_b_a_sleep_AND_598226_o, ram_ce_b_shut_down_AND_598225_o, 
        a_sleep_INV_288_o) ;   // URAM288.v(2900)
    
    ReadPort_12_72_0_4095_71_0 \ram_addr_b[11]_read_port_96  (.read_enable(1'b1), 
            .read_address({ram_addr_b}), .Ram(mem), .read_data( { \ram_addr_b[11]_read_port_96_read_data[71]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[70]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[69]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[68]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[67]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[66]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[65]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[64]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[63]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[62]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[61]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[60]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[59]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[58]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[57]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[56]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[55]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[54]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[53]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[52]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[51]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[50]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[49]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[48]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[47]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[46]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[45]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[44]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[43]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[42]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[41]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[40]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[39]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[38]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[37]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[36]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[35]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[34]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[33]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[32]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[31]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[30]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[29]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[28]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[27]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[26]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[25]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[24]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[23]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[22]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[21]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[20]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[19]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[18]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[17]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[16]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[15]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[14]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[13]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[12]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[11]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[10]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[9]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[8]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[7]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[6]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[5]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[4]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[3]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[2]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[1]_temp_read_port_ram_value , 
            \ram_addr_b[11]_read_port_96_read_data[0]_temp_read_port_ram_value  } ));   // URAM288.v(2901)
    assign \ram_addr_b[11]_read_port_96_OUT [71] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [71] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [71] : \ram_addr_b[11]_read_port_96_read_data[71]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [70] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [70] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [70] : \ram_addr_b[11]_read_port_96_read_data[70]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [69] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [69] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [69] : \ram_addr_b[11]_read_port_96_read_data[69]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [68] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [68] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [68] : \ram_addr_b[11]_read_port_96_read_data[68]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [67] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [67] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [67] : \ram_addr_b[11]_read_port_96_read_data[67]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [66] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [66] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [66] : \ram_addr_b[11]_read_port_96_read_data[66]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [65] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [65] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [65] : \ram_addr_b[11]_read_port_96_read_data[65]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [64] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [64] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [64] : \ram_addr_b[11]_read_port_96_read_data[64]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [63] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [63] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [63] : \ram_addr_b[11]_read_port_96_read_data[63]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [62] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [62] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [62] : \ram_addr_b[11]_read_port_96_read_data[62]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [61] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [61] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [61] : \ram_addr_b[11]_read_port_96_read_data[61]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [60] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [60] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [60] : \ram_addr_b[11]_read_port_96_read_data[60]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [59] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [59] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [59] : \ram_addr_b[11]_read_port_96_read_data[59]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [58] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [58] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [58] : \ram_addr_b[11]_read_port_96_read_data[58]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [57] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [57] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [57] : \ram_addr_b[11]_read_port_96_read_data[57]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [56] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [56] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [56] : \ram_addr_b[11]_read_port_96_read_data[56]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [55] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [55] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [55] : \ram_addr_b[11]_read_port_96_read_data[55]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [54] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [54] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [54] : \ram_addr_b[11]_read_port_96_read_data[54]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [53] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [53] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [53] : \ram_addr_b[11]_read_port_96_read_data[53]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [52] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [52] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [52] : \ram_addr_b[11]_read_port_96_read_data[52]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [51] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [51] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [51] : \ram_addr_b[11]_read_port_96_read_data[51]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [50] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [50] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [50] : \ram_addr_b[11]_read_port_96_read_data[50]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [49] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [49] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [49] : \ram_addr_b[11]_read_port_96_read_data[49]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [48] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [48] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [48] : \ram_addr_b[11]_read_port_96_read_data[48]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [47] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [47] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [47] : \ram_addr_b[11]_read_port_96_read_data[47]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [46] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [46] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [46] : \ram_addr_b[11]_read_port_96_read_data[46]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [45] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [45] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [45] : \ram_addr_b[11]_read_port_96_read_data[45]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [44] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [44] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [44] : \ram_addr_b[11]_read_port_96_read_data[44]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [43] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [43] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [43] : \ram_addr_b[11]_read_port_96_read_data[43]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [42] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [42] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [42] : \ram_addr_b[11]_read_port_96_read_data[42]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [41] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [41] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [41] : \ram_addr_b[11]_read_port_96_read_data[41]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [40] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [40] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [40] : \ram_addr_b[11]_read_port_96_read_data[40]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [39] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [39] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [39] : \ram_addr_b[11]_read_port_96_read_data[39]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [38] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [38] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [38] : \ram_addr_b[11]_read_port_96_read_data[38]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [37] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [37] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [37] : \ram_addr_b[11]_read_port_96_read_data[37]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [36] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [36] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [36] : \ram_addr_b[11]_read_port_96_read_data[36]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [35] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [35] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [35] : \ram_addr_b[11]_read_port_96_read_data[35]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [34] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [34] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [34] : \ram_addr_b[11]_read_port_96_read_data[34]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [33] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [33] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [33] : \ram_addr_b[11]_read_port_96_read_data[33]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [32] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [32] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [32] : \ram_addr_b[11]_read_port_96_read_data[32]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [31] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [31] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [31] : \ram_addr_b[11]_read_port_96_read_data[31]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [30] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [30] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [30] : \ram_addr_b[11]_read_port_96_read_data[30]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [29] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [29] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [29] : \ram_addr_b[11]_read_port_96_read_data[29]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [28] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [28] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [28] : \ram_addr_b[11]_read_port_96_read_data[28]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [27] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [27] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [27] : \ram_addr_b[11]_read_port_96_read_data[27]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [26] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [26] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [26] : \ram_addr_b[11]_read_port_96_read_data[26]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [25] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [25] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [25] : \ram_addr_b[11]_read_port_96_read_data[25]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [24] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [24] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [24] : \ram_addr_b[11]_read_port_96_read_data[24]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [23] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [23] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [23] : \ram_addr_b[11]_read_port_96_read_data[23]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [22] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [22] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [22] : \ram_addr_b[11]_read_port_96_read_data[22]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [21] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [21] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [21] : \ram_addr_b[11]_read_port_96_read_data[21]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [20] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [20] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [20] : \ram_addr_b[11]_read_port_96_read_data[20]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [19] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [19] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [19] : \ram_addr_b[11]_read_port_96_read_data[19]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [18] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [18] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [18] : \ram_addr_b[11]_read_port_96_read_data[18]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [17] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [17] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [17] : \ram_addr_b[11]_read_port_96_read_data[17]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [16] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [16] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [16] : \ram_addr_b[11]_read_port_96_read_data[16]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [15] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [15] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [15] : \ram_addr_b[11]_read_port_96_read_data[15]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [14] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [14] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [14] : \ram_addr_b[11]_read_port_96_read_data[14]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [13] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [13] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [13] : \ram_addr_b[11]_read_port_96_read_data[13]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [12] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [12] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [12] : \ram_addr_b[11]_read_port_96_read_data[12]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [11] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [11] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [11] : \ram_addr_b[11]_read_port_96_read_data[11]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [10] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [10] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [10] : \ram_addr_b[11]_read_port_96_read_data[10]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [9] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [9] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [9] : \ram_addr_b[11]_read_port_96_read_data[9]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [8] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [8] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [8] : \ram_addr_b[11]_read_port_96_read_data[8]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [7] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [7] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [7] : \ram_addr_b[11]_read_port_96_read_data[7]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [6] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [6] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [6] : \ram_addr_b[11]_read_port_96_read_data[6]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [5] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [5] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [5] : \ram_addr_b[11]_read_port_96_read_data[5]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [4] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [4] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [4] : \ram_addr_b[11]_read_port_96_read_data[4]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [3] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [3] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [3] : \ram_addr_b[11]_read_port_96_read_data[3]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [2] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [2] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [2] : \ram_addr_b[11]_read_port_96_read_data[2]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [1] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [1] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [1] : \ram_addr_b[11]_read_port_96_read_data[1]_temp_read_port_ram_value  ;
    assign \ram_addr_b[11]_read_port_96_OUT [0] =  (1'b1 && ram_we_b_a_sleep_AND_598222_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} )) ? \ram_data_b[71]_ram_addr_b[11]_or_94_OUT [0] :  (1'b1 && ram_we_a_a_sleep_AND_598216_o && ( {ram_addr_b[11], 
        ram_addr_b[10], ram_addr_b[9], ram_addr_b[8], ram_addr_b[7], 
        ram_addr_b[6], ram_addr_b[5], ram_addr_b[4], ram_addr_b[3], 
        ram_addr_b[2], ram_addr_b[1], ram_addr_b[0]} == {ram_addr_a[11], 
        ram_addr_a[10], ram_addr_a[9], ram_addr_a[8], ram_addr_a[7], 
        ram_addr_a[6], ram_addr_a[5], ram_addr_a[4], ram_addr_a[3], 
        ram_addr_a[2], ram_addr_a[1], ram_addr_a[0]} )) ? \ram_data_a[71]_ram_addr_a[11]_or_85_OUT [0] : \ram_addr_b[11]_read_port_96_read_data[0]_temp_read_port_ram_value  ;
    mux_72 \ram_data_b_out[71]_ram_addr_b[11]_mux_97  (.d0({\ram_data_b_out[71]_GND_593371_o_mux_89_OUT }), 
            .d1({\ram_addr_b[11]_read_port_96_OUT }), .cond(ram_ce_b_a_sleep_AND_598226_o), 
            .o({\ram_data_b_out[71]_ram_addr_b[11]_mux_97_OUT }));   // URAM288.v(2900)
    wide_dffrs_72 ram_data_b_out_c (.d({\ram_data_b_out[71]_ram_addr_b[11]_mux_97_OUT }), 
            .set({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .reset({72'b000000000000000000000000000000000000000000000000000000000000000000000000}), 
            .clock(CLK_in_INV_286_o), .q({ram_data_b_lat}));   // URAM288.v(2881)
    wide_dffrs_32 wake_count_c (.d({\wake_count[31]_GND_593371_o_mux_111_OUT }), 
            .set({32'b00000000000000000000000000000000}), .reset({32'b00000000000000000000000000000000}), 
            .clock(CLK), .q({wake_count}));   // URAM288.v(2954)
    LessThan_32u_32u \wake_count[31]_GND_593371_o_LessThan_102  (.cin(1'b0), 
            .a({wake_count[31], 31'b0000000000000000000000000000000}), .b({1'b0, 
            wake_count[30:0]}), .o(\wake_count[31]_GND_593371_o_LessThan_102_o ));   // URAM288.v(2957)
    or (auto_sleep_SLEEP_in_OR_590705_o, auto_sleep, SLEEP) ;   // URAM288.v(2958)
    or (auto_sleep_SHUTDOWN_in_OR_590706_o, auto_sleep_SLEEP_in_OR_590705_o, 
        SHUTDOWN) ;   // URAM288.v(2958)
    not (auto_sleep_INV_299_o, auto_sleep_SHUTDOWN_in_OR_590706_o) ;   // URAM288.v(2958)
    and (\wake_count[31]_auto_sleep_AND_598227_o , \wake_count[31]_GND_593371_o_LessThan_102_o , 
        auto_sleep_INV_299_o) ;   // URAM288.v(2957)
    not (SHUTDOWN_in_INV_300_o, SHUTDOWN) ;   // URAM288.v(2959)
    LessThan_32u_32u \wake_count[31]_GND_593371_o_LessThan_103  (.cin(1'b0), 
            .a({wake_count[31], 31'b0000000000000000000000000000010}), .b({1'b0, 
            wake_count[30:0]}), .o(\wake_count[31]_GND_593371_o_LessThan_103_o ));   // URAM288.v(2959)
    and (\SHUTDOWN_in_wake_count[31]_AND_598228_o , SHUTDOWN_in_INV_300_o, 
        \wake_count[31]_GND_593371_o_LessThan_103_o ) ;   // URAM288.v(2959)
    or (\wake_count[31]_SHUTDOWN_in_OR_590707_o , \wake_count[31]_auto_sleep_AND_598227_o , 
        \SHUTDOWN_in_wake_count[31]_AND_598228_o ) ;   // URAM288.v(2957)
    LessThan_32u_32u \wake_count[31]_GND_593371_o_LessThan_104  (.cin(1'b0), 
            .a({wake_count[31], 31'b0000000000000000000000000000011}), .b({1'b0, 
            wake_count[30:0]}), .o(\wake_count[31]_GND_593371_o_LessThan_104_o ));   // URAM288.v(2960)
    and (\SHUTDOWN_in_wake_count[31]_AND_598229_o , SHUTDOWN_in_INV_300_o, 
        \wake_count[31]_GND_593371_o_LessThan_104_o ) ;   // URAM288.v(2960)
    or (\wake_count[31]_SHUTDOWN_in_OR_590708_o , \wake_count[31]_SHUTDOWN_in_OR_590707_o , 
        \SHUTDOWN_in_wake_count[31]_AND_598229_o ) ;   // URAM288.v(2957)
    sub_32 \wake_count[31]_GND_593371_o_sub_105  (.a({wake_count}), .b({32'b00000000000000000000000000000001}), 
           .o({\wake_count[31]_GND_593371_o_sub_105_OUT }));   // URAM288.v(2961)
    LessThan_32u_32u \GND_593371_o_wake_count[31]_LessThan_106  (.cin(1'b1), 
            .a({1'b0, wake_count[30:0]}), .b({wake_count[31], 31'b0000000000000000000000000000010}), 
            .o(\GND_593371_o_wake_count[31]_LessThan_106_o ));   // URAM288.v(2966)
    and (SLEEP_in_GND_593371_o_AND_598230_o, SLEEP, \GND_593371_o_wake_count[31]_LessThan_106_o ) ;   // URAM288.v(2966)
    LessThan_32u_32u \GND_593371_o_wake_count[31]_LessThan_107  (.cin(1'b1), 
            .a({1'b0, wake_count[30:0]}), .b({wake_count[31], 31'b0000000000000000000000000000001}), 
            .o(\GND_593371_o_wake_count[31]_LessThan_107_o ));   // URAM288.v(2968)
    and (auto_sleep_GND_593371_o_AND_598231_o, auto_sleep, \GND_593371_o_wake_count[31]_LessThan_107_o ) ;   // URAM288.v(2968)
    mux_32 \wake_count[31]_GND_593371_o_mux_107  (.d0({wake_count}), .d1({32'b00000000000000000000000000000001}), 
           .cond(auto_sleep_GND_593371_o_AND_598231_o), .o({\wake_count[31]_GND_593371_o_mux_107_OUT }));   // URAM288.v(2968)
    mux_32 \wake_count[31]_GND_593371_o_mux_108  (.d0({\wake_count[31]_GND_593371_o_mux_107_OUT }), 
           .d1({32'b00000000000000000000000000000010}), .cond(SLEEP_in_GND_593371_o_AND_598230_o), 
           .o({\wake_count[31]_GND_593371_o_mux_108_OUT }));   // URAM288.v(2968)
    mux_32 \wake_count[31]_GND_593371_o_mux_109  (.d0({\wake_count[31]_GND_593371_o_mux_108_OUT }), 
           .d1({32'b00000000000000000000000000001001}), .cond(SHUTDOWN), 
           .o({\wake_count[31]_GND_593371_o_mux_109_OUT }));   // URAM288.v(2964)
    mux_32 \wake_count[31]_wake_count[31]_mux_110  (.d0({\wake_count[31]_GND_593371_o_mux_109_OUT }), 
           .d1({\wake_count[31]_GND_593371_o_sub_105_OUT }), .cond(\wake_count[31]_SHUTDOWN_in_OR_590708_o ), 
           .o({\wake_count[31]_wake_count[31]_mux_110_OUT }));   // URAM288.v(2962)
    mux_32 \wake_count[31]_GND_593371_o_mux_111  (.d0({\wake_count[31]_wake_count[31]_mux_110_OUT }), 
           .d1({32'b00000000000000000000000000000000}), .cond(1'b0), .o({\wake_count[31]_GND_593371_o_mux_111_OUT }));   // URAM288.v(2957)
    VERIFIC_DFFRS a_sleep_c (.d(a_sleep_GND_593371_o_MUX_3249229_o), .clk(CLK), 
            .s(1'b0), .r(1'b0), .q(a_sleep));   // URAM288.v(2973)
    not (auto_sleep_INV_302_o, auto_sleep) ;   // URAM288.v(2974)
    equal_32 \wake_count[31]_GND_593371_o_equal_115  (.a({wake_count}), .b({32'b00000000000000000000000000000001}), 
            .o(\wake_count[31]_GND_593371_o_equal_115_o ));   // URAM288.v(2974)
    and (\auto_sleep_wake_count[31]_AND_598232_o , auto_sleep_INV_302_o, 
        \wake_count[31]_GND_593371_o_equal_115_o ) ;   // URAM288.v(2974)
    assign a_sleep_PWR_23_o_MUX_3249228_o = auto_sleep_SLEEP_in_OR_590705_o ? 1'b1 : a_sleep;   // URAM288.v(2976)
    assign a_sleep_GND_593371_o_MUX_3249229_o = \auto_sleep_wake_count[31]_AND_598232_o  ? 1'b0 : a_sleep_PWR_23_o_MUX_3249228_o;   // URAM288.v(2976)
    VERIFIC_DFFRS shut_down_c (.d(shut_down_GND_593371_o_MUX_3249231_o), .clk(CLK), 
            .s(1'b0), .r(1'b0), .q(shut_down));   // URAM288.v(2981)
    assign shut_down_PWR_23_o_MUX_3249230_o = SHUTDOWN ? 1'b1 : shut_down;   // URAM288.v(2984)
    assign shut_down_GND_593371_o_MUX_3249231_o = \wake_count[31]_GND_593371_o_equal_115_o  ? 1'b0 : shut_down_PWR_23_o_MUX_3249230_o;   // URAM288.v(2984)
    VERIFIC_DFFRS auto_sleep_A_c (.d(1'b0), .clk(CLK), .s(1'b0), .r(1'b0), 
            .q(auto_sleep_A));   // URAM288.v(2992)
    and (auto_sleep_A_auto_sleep_B_AND_598233_o, auto_sleep_A, auto_sleep_B) ;   // URAM288.v(2989)
    not (auto_wake_up_A_INV_303_o, ram_ce_a_fifo[3]) ;   // URAM288.v(2989)
    and (auto_sleep_A_auto_wake_up_A_AND_598234_o, auto_sleep_A_auto_sleep_B_AND_598233_o, 
        auto_wake_up_A_INV_303_o) ;   // URAM288.v(2989)
    not (auto_wake_up_B_INV_304_o, ram_ce_b_fifo[3]) ;   // URAM288.v(2989)
    and (auto_sleep, auto_sleep_A_auto_wake_up_A_AND_598234_o, auto_wake_up_B_INV_304_o) ;   // URAM288.v(2989)
    VERIFIC_DFFRS auto_sleep_B_c (.d(1'b0), .clk(CLK), .s(1'b0), .r(1'b0), 
            .q(auto_sleep_B));   // URAM288.v(3003)
    VERIFIC_DFFRS RST_A_sync_c (.d(RST_A_sync_RST_A_in_MUX_3249152_o), .clk(CLK), 
            .s(1'b0), .r(1'b0), .q(RST_A_sync));   // URAM288.v(1780)
    VERIFIC_DLATCHRS data_A_enable_c (.d(1'bx), .gate(1'b0), .s(ram_ce_a_int_RDB_WR_A_int_AND_598213_o), 
            .r(1'b0), .q(data_A_enable));   // URAM288.v(2380)
    
endmodule

//
// Verific Verilog Description of PRIMITIVE VERIFIC_DFFRS
//

module VERIFIC_DFFRS (d, clk, s, r, q);
    input d;
    input clk;
    input s;
    input r;
    output q;
    reg q ;
    always @(posedge clk or posedge s or posedge r) begin
        if (s) q = 1'b1;
        else if (r) q = 1'b0;
        else q = d;
    end
    
endmodule

//
// Verific Verilog Description of PRIMITIVE VERIFIC_DLATCHRS
//

module VERIFIC_DLATCHRS (d, gate, s, r, q);
    input d;
    input gate;
    input s;
    input r;
    output q;
    reg q ;
    always @(gate or s or r or d) begin
        if (s) q = 1'b1;
        else if (r) q = 1'b0;
        else if (gate) q = d;
    end
    
endmodule

//
// Verific Verilog Description of OPERATOR mux_72
//

module mux_72 (d0, d1, cond, o);
    input [71:0]d0;
    input [71:0]d1;
    input cond;
    output [71:0]o;
    
    assign o = (cond ? d1 : d0);
    
endmodule

//
// Verific Verilog Description of OPERATOR wide_dffrs_1
//

module wide_dffrs_1 (d, set, reset, clock, q);
    input [0:0]d;
    input [0:0]set;
    input [0:0]reset;
    input clock;
    output [0:0]q;
    
    
    VERIFIC_DFFRS \d[0]_clock_DFFRS_138  (.d(d[0]), .clk(clock), .s(set[0]), 
            .r(reset[0]), .q(q[0]));
    
endmodule

//
// Verific Verilog Description of OPERATOR xor_11
//

module xor_11 (a, b, o);
    input [10:0]a;
    input [10:0]b;
    output [10:0]o;
    
    assign o = a ^ b;
    
endmodule

//
// Verific Verilog Description of OPERATOR inv_11
//

module inv_11 (i, o);
    input [10:0]i;
    output [10:0]o;
    
    assign o = ~i;
    
endmodule

//
// Verific Verilog Description of OPERATOR or_11
//

module or_11 (a, b, o);
    input [10:0]a;
    input [10:0]b;
    output [10:0]o;
    
    assign o = a | b;
    
endmodule

//
// Verific Verilog Description of OPERATOR wide_dffrs_72
//

module wide_dffrs_72 (d, set, reset, clock, q);
    input [71:0]d;
    input [71:0]set;
    input [71:0]reset;
    input clock;
    output [71:0]q;
    
    
    VERIFIC_DFFRS \d[0]_clock_DFFRS_36  (.d(d[0]), .clk(clock), .s(set[0]), 
            .r(reset[0]), .q(q[0]));
    VERIFIC_DFFRS \d[1]_clock_DFFRS_37  (.d(d[1]), .clk(clock), .s(set[1]), 
            .r(reset[1]), .q(q[1]));
    VERIFIC_DFFRS \d[2]_clock_DFFRS_38  (.d(d[2]), .clk(clock), .s(set[2]), 
            .r(reset[2]), .q(q[2]));
    VERIFIC_DFFRS \d[3]_clock_DFFRS_39  (.d(d[3]), .clk(clock), .s(set[3]), 
            .r(reset[3]), .q(q[3]));
    VERIFIC_DFFRS \d[4]_clock_DFFRS_40  (.d(d[4]), .clk(clock), .s(set[4]), 
            .r(reset[4]), .q(q[4]));
    VERIFIC_DFFRS \d[5]_clock_DFFRS_41  (.d(d[5]), .clk(clock), .s(set[5]), 
            .r(reset[5]), .q(q[5]));
    VERIFIC_DFFRS \d[6]_clock_DFFRS_42  (.d(d[6]), .clk(clock), .s(set[6]), 
            .r(reset[6]), .q(q[6]));
    VERIFIC_DFFRS \d[7]_clock_DFFRS_43  (.d(d[7]), .clk(clock), .s(set[7]), 
            .r(reset[7]), .q(q[7]));
    VERIFIC_DFFRS \d[8]_clock_DFFRS_44  (.d(d[8]), .clk(clock), .s(set[8]), 
            .r(reset[8]), .q(q[8]));
    VERIFIC_DFFRS \d[9]_clock_DFFRS_45  (.d(d[9]), .clk(clock), .s(set[9]), 
            .r(reset[9]), .q(q[9]));
    VERIFIC_DFFRS \d[10]_clock_DFFRS_46  (.d(d[10]), .clk(clock), .s(set[10]), 
            .r(reset[10]), .q(q[10]));
    VERIFIC_DFFRS \d[11]_clock_DFFRS_47  (.d(d[11]), .clk(clock), .s(set[11]), 
            .r(reset[11]), .q(q[11]));
    VERIFIC_DFFRS \d[12]_clock_DFFRS_48  (.d(d[12]), .clk(clock), .s(set[12]), 
            .r(reset[12]), .q(q[12]));
    VERIFIC_DFFRS \d[13]_clock_DFFRS_49  (.d(d[13]), .clk(clock), .s(set[13]), 
            .r(reset[13]), .q(q[13]));
    VERIFIC_DFFRS \d[14]_clock_DFFRS_50  (.d(d[14]), .clk(clock), .s(set[14]), 
            .r(reset[14]), .q(q[14]));
    VERIFIC_DFFRS \d[15]_clock_DFFRS_51  (.d(d[15]), .clk(clock), .s(set[15]), 
            .r(reset[15]), .q(q[15]));
    VERIFIC_DFFRS \d[16]_clock_DFFRS_52  (.d(d[16]), .clk(clock), .s(set[16]), 
            .r(reset[16]), .q(q[16]));
    VERIFIC_DFFRS \d[17]_clock_DFFRS_53  (.d(d[17]), .clk(clock), .s(set[17]), 
            .r(reset[17]), .q(q[17]));
    VERIFIC_DFFRS \d[18]_clock_DFFRS_54  (.d(d[18]), .clk(clock), .s(set[18]), 
            .r(reset[18]), .q(q[18]));
    VERIFIC_DFFRS \d[19]_clock_DFFRS_55  (.d(d[19]), .clk(clock), .s(set[19]), 
            .r(reset[19]), .q(q[19]));
    VERIFIC_DFFRS \d[20]_clock_DFFRS_56  (.d(d[20]), .clk(clock), .s(set[20]), 
            .r(reset[20]), .q(q[20]));
    VERIFIC_DFFRS \d[21]_clock_DFFRS_57  (.d(d[21]), .clk(clock), .s(set[21]), 
            .r(reset[21]), .q(q[21]));
    VERIFIC_DFFRS \d[22]_clock_DFFRS_58  (.d(d[22]), .clk(clock), .s(set[22]), 
            .r(reset[22]), .q(q[22]));
    VERIFIC_DFFRS \d[23]_clock_DFFRS_59  (.d(d[23]), .clk(clock), .s(set[23]), 
            .r(reset[23]), .q(q[23]));
    VERIFIC_DFFRS \d[24]_clock_DFFRS_60  (.d(d[24]), .clk(clock), .s(set[24]), 
            .r(reset[24]), .q(q[24]));
    VERIFIC_DFFRS \d[25]_clock_DFFRS_61  (.d(d[25]), .clk(clock), .s(set[25]), 
            .r(reset[25]), .q(q[25]));
    VERIFIC_DFFRS \d[26]_clock_DFFRS_62  (.d(d[26]), .clk(clock), .s(set[26]), 
            .r(reset[26]), .q(q[26]));
    VERIFIC_DFFRS \d[27]_clock_DFFRS_63  (.d(d[27]), .clk(clock), .s(set[27]), 
            .r(reset[27]), .q(q[27]));
    VERIFIC_DFFRS \d[28]_clock_DFFRS_64  (.d(d[28]), .clk(clock), .s(set[28]), 
            .r(reset[28]), .q(q[28]));
    VERIFIC_DFFRS \d[29]_clock_DFFRS_65  (.d(d[29]), .clk(clock), .s(set[29]), 
            .r(reset[29]), .q(q[29]));
    VERIFIC_DFFRS \d[30]_clock_DFFRS_66  (.d(d[30]), .clk(clock), .s(set[30]), 
            .r(reset[30]), .q(q[30]));
    VERIFIC_DFFRS \d[31]_clock_DFFRS_67  (.d(d[31]), .clk(clock), .s(set[31]), 
            .r(reset[31]), .q(q[31]));
    VERIFIC_DFFRS \d[32]_clock_DFFRS_68  (.d(d[32]), .clk(clock), .s(set[32]), 
            .r(reset[32]), .q(q[32]));
    VERIFIC_DFFRS \d[33]_clock_DFFRS_69  (.d(d[33]), .clk(clock), .s(set[33]), 
            .r(reset[33]), .q(q[33]));
    VERIFIC_DFFRS \d[34]_clock_DFFRS_70  (.d(d[34]), .clk(clock), .s(set[34]), 
            .r(reset[34]), .q(q[34]));
    VERIFIC_DFFRS \d[35]_clock_DFFRS_71  (.d(d[35]), .clk(clock), .s(set[35]), 
            .r(reset[35]), .q(q[35]));
    VERIFIC_DFFRS \d[36]_clock_DFFRS_72  (.d(d[36]), .clk(clock), .s(set[36]), 
            .r(reset[36]), .q(q[36]));
    VERIFIC_DFFRS \d[37]_clock_DFFRS_73  (.d(d[37]), .clk(clock), .s(set[37]), 
            .r(reset[37]), .q(q[37]));
    VERIFIC_DFFRS \d[38]_clock_DFFRS_74  (.d(d[38]), .clk(clock), .s(set[38]), 
            .r(reset[38]), .q(q[38]));
    VERIFIC_DFFRS \d[39]_clock_DFFRS_75  (.d(d[39]), .clk(clock), .s(set[39]), 
            .r(reset[39]), .q(q[39]));
    VERIFIC_DFFRS \d[40]_clock_DFFRS_76  (.d(d[40]), .clk(clock), .s(set[40]), 
            .r(reset[40]), .q(q[40]));
    VERIFIC_DFFRS \d[41]_clock_DFFRS_77  (.d(d[41]), .clk(clock), .s(set[41]), 
            .r(reset[41]), .q(q[41]));
    VERIFIC_DFFRS \d[42]_clock_DFFRS_78  (.d(d[42]), .clk(clock), .s(set[42]), 
            .r(reset[42]), .q(q[42]));
    VERIFIC_DFFRS \d[43]_clock_DFFRS_79  (.d(d[43]), .clk(clock), .s(set[43]), 
            .r(reset[43]), .q(q[43]));
    VERIFIC_DFFRS \d[44]_clock_DFFRS_80  (.d(d[44]), .clk(clock), .s(set[44]), 
            .r(reset[44]), .q(q[44]));
    VERIFIC_DFFRS \d[45]_clock_DFFRS_81  (.d(d[45]), .clk(clock), .s(set[45]), 
            .r(reset[45]), .q(q[45]));
    VERIFIC_DFFRS \d[46]_clock_DFFRS_82  (.d(d[46]), .clk(clock), .s(set[46]), 
            .r(reset[46]), .q(q[46]));
    VERIFIC_DFFRS \d[47]_clock_DFFRS_83  (.d(d[47]), .clk(clock), .s(set[47]), 
            .r(reset[47]), .q(q[47]));
    VERIFIC_DFFRS \d[48]_clock_DFFRS_84  (.d(d[48]), .clk(clock), .s(set[48]), 
            .r(reset[48]), .q(q[48]));
    VERIFIC_DFFRS \d[49]_clock_DFFRS_85  (.d(d[49]), .clk(clock), .s(set[49]), 
            .r(reset[49]), .q(q[49]));
    VERIFIC_DFFRS \d[50]_clock_DFFRS_86  (.d(d[50]), .clk(clock), .s(set[50]), 
            .r(reset[50]), .q(q[50]));
    VERIFIC_DFFRS \d[51]_clock_DFFRS_87  (.d(d[51]), .clk(clock), .s(set[51]), 
            .r(reset[51]), .q(q[51]));
    VERIFIC_DFFRS \d[52]_clock_DFFRS_88  (.d(d[52]), .clk(clock), .s(set[52]), 
            .r(reset[52]), .q(q[52]));
    VERIFIC_DFFRS \d[53]_clock_DFFRS_89  (.d(d[53]), .clk(clock), .s(set[53]), 
            .r(reset[53]), .q(q[53]));
    VERIFIC_DFFRS \d[54]_clock_DFFRS_90  (.d(d[54]), .clk(clock), .s(set[54]), 
            .r(reset[54]), .q(q[54]));
    VERIFIC_DFFRS \d[55]_clock_DFFRS_91  (.d(d[55]), .clk(clock), .s(set[55]), 
            .r(reset[55]), .q(q[55]));
    VERIFIC_DFFRS \d[56]_clock_DFFRS_92  (.d(d[56]), .clk(clock), .s(set[56]), 
            .r(reset[56]), .q(q[56]));
    VERIFIC_DFFRS \d[57]_clock_DFFRS_93  (.d(d[57]), .clk(clock), .s(set[57]), 
            .r(reset[57]), .q(q[57]));
    VERIFIC_DFFRS \d[58]_clock_DFFRS_94  (.d(d[58]), .clk(clock), .s(set[58]), 
            .r(reset[58]), .q(q[58]));
    VERIFIC_DFFRS \d[59]_clock_DFFRS_95  (.d(d[59]), .clk(clock), .s(set[59]), 
            .r(reset[59]), .q(q[59]));
    VERIFIC_DFFRS \d[60]_clock_DFFRS_96  (.d(d[60]), .clk(clock), .s(set[60]), 
            .r(reset[60]), .q(q[60]));
    VERIFIC_DFFRS \d[61]_clock_DFFRS_97  (.d(d[61]), .clk(clock), .s(set[61]), 
            .r(reset[61]), .q(q[61]));
    VERIFIC_DFFRS \d[62]_clock_DFFRS_98  (.d(d[62]), .clk(clock), .s(set[62]), 
            .r(reset[62]), .q(q[62]));
    VERIFIC_DFFRS \d[63]_clock_DFFRS_99  (.d(d[63]), .clk(clock), .s(set[63]), 
            .r(reset[63]), .q(q[63]));
    VERIFIC_DFFRS \d[64]_clock_DFFRS_100  (.d(d[64]), .clk(clock), .s(set[64]), 
            .r(reset[64]), .q(q[64]));
    VERIFIC_DFFRS \d[65]_clock_DFFRS_101  (.d(d[65]), .clk(clock), .s(set[65]), 
            .r(reset[65]), .q(q[65]));
    VERIFIC_DFFRS \d[66]_clock_DFFRS_102  (.d(d[66]), .clk(clock), .s(set[66]), 
            .r(reset[66]), .q(q[66]));
    VERIFIC_DFFRS \d[67]_clock_DFFRS_103  (.d(d[67]), .clk(clock), .s(set[67]), 
            .r(reset[67]), .q(q[67]));
    VERIFIC_DFFRS \d[68]_clock_DFFRS_104  (.d(d[68]), .clk(clock), .s(set[68]), 
            .r(reset[68]), .q(q[68]));
    VERIFIC_DFFRS \d[69]_clock_DFFRS_105  (.d(d[69]), .clk(clock), .s(set[69]), 
            .r(reset[69]), .q(q[69]));
    VERIFIC_DFFRS \d[70]_clock_DFFRS_106  (.d(d[70]), .clk(clock), .s(set[70]), 
            .r(reset[70]), .q(q[70]));
    VERIFIC_DFFRS \d[71]_clock_DFFRS_107  (.d(d[71]), .clk(clock), .s(set[71]), 
            .r(reset[71]), .q(q[71]));
    
endmodule

//
// Verific Verilog Description of OPERATOR wide_dffrs_12
//

module wide_dffrs_12 (d, set, reset, clock, q);
    input [11:0]d;
    input [11:0]set;
    input [11:0]reset;
    input clock;
    output [11:0]q;
    
    
    VERIFIC_DFFRS \d[0]_clock_DFFRS_139  (.d(d[0]), .clk(clock), .s(set[0]), 
            .r(reset[0]), .q(q[0]));
    VERIFIC_DFFRS \d[1]_clock_DFFRS_140  (.d(d[1]), .clk(clock), .s(set[1]), 
            .r(reset[1]), .q(q[1]));
    VERIFIC_DFFRS \d[2]_clock_DFFRS_141  (.d(d[2]), .clk(clock), .s(set[2]), 
            .r(reset[2]), .q(q[2]));
    VERIFIC_DFFRS \d[3]_clock_DFFRS_142  (.d(d[3]), .clk(clock), .s(set[3]), 
            .r(reset[3]), .q(q[3]));
    VERIFIC_DFFRS \d[4]_clock_DFFRS_143  (.d(d[4]), .clk(clock), .s(set[4]), 
            .r(reset[4]), .q(q[4]));
    VERIFIC_DFFRS \d[5]_clock_DFFRS_144  (.d(d[5]), .clk(clock), .s(set[5]), 
            .r(reset[5]), .q(q[5]));
    VERIFIC_DFFRS \d[6]_clock_DFFRS_145  (.d(d[6]), .clk(clock), .s(set[6]), 
            .r(reset[6]), .q(q[6]));
    VERIFIC_DFFRS \d[7]_clock_DFFRS_146  (.d(d[7]), .clk(clock), .s(set[7]), 
            .r(reset[7]), .q(q[7]));
    VERIFIC_DFFRS \d[8]_clock_DFFRS_147  (.d(d[8]), .clk(clock), .s(set[8]), 
            .r(reset[8]), .q(q[8]));
    VERIFIC_DFFRS \d[9]_clock_DFFRS_148  (.d(d[9]), .clk(clock), .s(set[9]), 
            .r(reset[9]), .q(q[9]));
    VERIFIC_DFFRS \d[10]_clock_DFFRS_149  (.d(d[10]), .clk(clock), .s(set[10]), 
            .r(reset[10]), .q(q[10]));
    VERIFIC_DFFRS \d[11]_clock_DFFRS_150  (.d(d[11]), .clk(clock), .s(set[11]), 
            .r(reset[11]), .q(q[11]));
    
endmodule

//
// Verific Verilog Description of OPERATOR mux_12
//

module mux_12 (d0, d1, cond, o);
    input [11:0]d0;
    input [11:0]d1;
    input cond;
    output [11:0]o;
    
    assign o = (cond ? d1 : d0);
    
endmodule

//
// Verific Verilog Description of OPERATOR and_72
//

module and_72 (a, b, o);
    input [71:0]a;
    input [71:0]b;
    output [71:0]o;
    
    assign o = a & b;
    
endmodule

//
// Verific Verilog Description of OPERATOR ReadPort_12_72_0_4095_71_0
//

module ReadPort_12_72_0_4095_71_0 (read_enable, read_address, read_data, 
            Ram);
    input read_enable;
    input [11:0]read_address;
    output [71:0]read_data;
    input [294911:0] Ram;
    reg [72-1:0] read_data ;
    // wire [31:0] offset0 ;
    // assign offset0 = -(read_address[11:0] - (4095)) ;
    always @(read_enable, read_address,Ram) if (read_enable) read_data = Ram[-(read_address[11:0]-(4095) /* offset0 */) *72 +: 72] ;
    
endmodule

//
// Verific Verilog Description of OPERATOR inv_72
//

module inv_72 (i, o);
    input [71:0]i;
    output [71:0]o;
    
    assign o = ~i;
    
endmodule

//
// Verific Verilog Description of OPERATOR or_72
//

module or_72 (a, b, o);
    input [71:0]a;
    input [71:0]b;
    output [71:0]o;
    
    assign o = a | b;
    
endmodule

//
// Verific Verilog Description of OPERATOR wide_dffrs_32
//

module wide_dffrs_32 (d, set, reset, clock, q);
    input [31:0]d;
    input [31:0]set;
    input [31:0]reset;
    input clock;
    output [31:0]q;
    
    
    VERIFIC_DFFRS \d[0]_clock_DFFRS_155  (.d(d[0]), .clk(clock), .s(set[0]), 
            .r(reset[0]), .q(q[0]));
    VERIFIC_DFFRS \d[1]_clock_DFFRS_156  (.d(d[1]), .clk(clock), .s(set[1]), 
            .r(reset[1]), .q(q[1]));
    VERIFIC_DFFRS \d[2]_clock_DFFRS_157  (.d(d[2]), .clk(clock), .s(set[2]), 
            .r(reset[2]), .q(q[2]));
    VERIFIC_DFFRS \d[3]_clock_DFFRS_158  (.d(d[3]), .clk(clock), .s(set[3]), 
            .r(reset[3]), .q(q[3]));
    VERIFIC_DFFRS \d[4]_clock_DFFRS_159  (.d(d[4]), .clk(clock), .s(set[4]), 
            .r(reset[4]), .q(q[4]));
    VERIFIC_DFFRS \d[5]_clock_DFFRS_160  (.d(d[5]), .clk(clock), .s(set[5]), 
            .r(reset[5]), .q(q[5]));
    VERIFIC_DFFRS \d[6]_clock_DFFRS_161  (.d(d[6]), .clk(clock), .s(set[6]), 
            .r(reset[6]), .q(q[6]));
    VERIFIC_DFFRS \d[7]_clock_DFFRS_162  (.d(d[7]), .clk(clock), .s(set[7]), 
            .r(reset[7]), .q(q[7]));
    VERIFIC_DFFRS \d[8]_clock_DFFRS_163  (.d(d[8]), .clk(clock), .s(set[8]), 
            .r(reset[8]), .q(q[8]));
    VERIFIC_DFFRS \d[9]_clock_DFFRS_164  (.d(d[9]), .clk(clock), .s(set[9]), 
            .r(reset[9]), .q(q[9]));
    VERIFIC_DFFRS \d[10]_clock_DFFRS_165  (.d(d[10]), .clk(clock), .s(set[10]), 
            .r(reset[10]), .q(q[10]));
    VERIFIC_DFFRS \d[11]_clock_DFFRS_166  (.d(d[11]), .clk(clock), .s(set[11]), 
            .r(reset[11]), .q(q[11]));
    VERIFIC_DFFRS \d[12]_clock_DFFRS_167  (.d(d[12]), .clk(clock), .s(set[12]), 
            .r(reset[12]), .q(q[12]));
    VERIFIC_DFFRS \d[13]_clock_DFFRS_168  (.d(d[13]), .clk(clock), .s(set[13]), 
            .r(reset[13]), .q(q[13]));
    VERIFIC_DFFRS \d[14]_clock_DFFRS_169  (.d(d[14]), .clk(clock), .s(set[14]), 
            .r(reset[14]), .q(q[14]));
    VERIFIC_DFFRS \d[15]_clock_DFFRS_170  (.d(d[15]), .clk(clock), .s(set[15]), 
            .r(reset[15]), .q(q[15]));
    VERIFIC_DFFRS \d[16]_clock_DFFRS_171  (.d(d[16]), .clk(clock), .s(set[16]), 
            .r(reset[16]), .q(q[16]));
    VERIFIC_DFFRS \d[17]_clock_DFFRS_172  (.d(d[17]), .clk(clock), .s(set[17]), 
            .r(reset[17]), .q(q[17]));
    VERIFIC_DFFRS \d[18]_clock_DFFRS_173  (.d(d[18]), .clk(clock), .s(set[18]), 
            .r(reset[18]), .q(q[18]));
    VERIFIC_DFFRS \d[19]_clock_DFFRS_174  (.d(d[19]), .clk(clock), .s(set[19]), 
            .r(reset[19]), .q(q[19]));
    VERIFIC_DFFRS \d[20]_clock_DFFRS_175  (.d(d[20]), .clk(clock), .s(set[20]), 
            .r(reset[20]), .q(q[20]));
    VERIFIC_DFFRS \d[21]_clock_DFFRS_176  (.d(d[21]), .clk(clock), .s(set[21]), 
            .r(reset[21]), .q(q[21]));
    VERIFIC_DFFRS \d[22]_clock_DFFRS_177  (.d(d[22]), .clk(clock), .s(set[22]), 
            .r(reset[22]), .q(q[22]));
    VERIFIC_DFFRS \d[23]_clock_DFFRS_178  (.d(d[23]), .clk(clock), .s(set[23]), 
            .r(reset[23]), .q(q[23]));
    VERIFIC_DFFRS \d[24]_clock_DFFRS_179  (.d(d[24]), .clk(clock), .s(set[24]), 
            .r(reset[24]), .q(q[24]));
    VERIFIC_DFFRS \d[25]_clock_DFFRS_180  (.d(d[25]), .clk(clock), .s(set[25]), 
            .r(reset[25]), .q(q[25]));
    VERIFIC_DFFRS \d[26]_clock_DFFRS_181  (.d(d[26]), .clk(clock), .s(set[26]), 
            .r(reset[26]), .q(q[26]));
    VERIFIC_DFFRS \d[27]_clock_DFFRS_182  (.d(d[27]), .clk(clock), .s(set[27]), 
            .r(reset[27]), .q(q[27]));
    VERIFIC_DFFRS \d[28]_clock_DFFRS_183  (.d(d[28]), .clk(clock), .s(set[28]), 
            .r(reset[28]), .q(q[28]));
    VERIFIC_DFFRS \d[29]_clock_DFFRS_184  (.d(d[29]), .clk(clock), .s(set[29]), 
            .r(reset[29]), .q(q[29]));
    VERIFIC_DFFRS \d[30]_clock_DFFRS_185  (.d(d[30]), .clk(clock), .s(set[30]), 
            .r(reset[30]), .q(q[30]));
    VERIFIC_DFFRS \d[31]_clock_DFFRS_186  (.d(d[31]), .clk(clock), .s(set[31]), 
            .r(reset[31]), .q(q[31]));
    
endmodule

//
// Verific Verilog Description of OPERATOR LessThan_32u_32u
//

module LessThan_32u_32u (cin, a, b, o);
    input cin;
    input [31:0]a;
    input [31:0]b;
    output o;
    assign o = cin ? a<=b : a<b ;
    
endmodule

//
// Verific Verilog Description of OPERATOR sub_32
//

module sub_32 (a, b, o);
    input [31:0]a;
    input [31:0]b;
    output [31:0]o;
    
    assign o = a - b;
    
endmodule

//
// Verific Verilog Description of OPERATOR mux_32
//

module mux_32 (d0, d1, cond, o);
    input [31:0]d0;
    input [31:0]d1;
    input cond;
    output [31:0]o;
    
    assign o = (cond ? d1 : d0);
    
endmodule

//
// Verific Verilog Description of OPERATOR equal_32
//

module equal_32 (a, b, o);
    input [31:0]a;
    input [31:0]b;
    output o;
    
    assign o = (a == b);
    
endmodule
