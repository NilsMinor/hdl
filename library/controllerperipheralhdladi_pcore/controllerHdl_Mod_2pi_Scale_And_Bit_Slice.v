// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_Mod_2pi_Scale_And_Bit_Slice.v
// Created: 2014-08-27 21:15:34
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_Mod_2pi_Scale_And_Bit_Slice
// Source Path: controllerHdl/Encoder_To_Position_And_Velocity/Rotor_To_Electrical_Position/Mod_2pi_Scale_And_Bit_Slice
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_Mod_2pi_Scale_And_Bit_Slice
          (
           u,
           y
          );


  input   signed [17:0] u;  // sfix18_En12
  output  signed [17:0] y;  // sfix18_En14


  wire signed [35:0] Pre_Scale_mul_temp;  // sfix36_En13
  wire [35:0] Pre_Scale_out1;  // ufix36
  wire [17:0] y_1;  // ufix18
  wire [35:0] Post_Scale_mul_temp;  // ufix36_En33
  wire signed [17:0] Post_Scale_out1;  // sfix18_En14


  // <S11>/Pre_Scale
  // 
  // <S11>/Remove Scaling
  assign Pre_Scale_mul_temp = 83443 * u;
  assign Pre_Scale_out1 = {{13{Pre_Scale_mul_temp[35]}}, Pre_Scale_mul_temp[35:13]};



  // <S11>/Mark_Extract_Bits
  controllerHdl_Mark_Extract_Bits   u_Mark_Extract_Bits   (.In1(Pre_Scale_out1),  // ufix36
                                                           .Out1(y_1)  // ufix18
                                                           );

  // <S11>/Post_Scale
  assign Post_Scale_mul_temp = 205888 * y_1;
  assign Post_Scale_out1 = Post_Scale_mul_temp[35:19];



  assign y = Post_Scale_out1;

endmodule  // controllerHdl_Mod_2pi_Scale_And_Bit_Slice

