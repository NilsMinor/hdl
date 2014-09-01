// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_Transform_dq_to_ABC.v
// Created: 2014-08-27 21:15:34
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_Transform_dq_to_ABC
// Source Path: controllerHdl/Field_Oriented_Control/Open_Loop_Control/Transform_dq_to_ABC
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_Transform_dq_to_ABC
          (
           d,
           q,
           sin,
           cos,
           ABC_0,
           ABC_1,
           ABC_2
          );


  input   signed [17:0] d;  // sfix18_En12
  input   signed [17:0] q;  // sfix18_En12
  input   signed [17:0] sin;  // sfix18_En16
  input   signed [17:0] cos;  // sfix18_En16
  output  signed [17:0] ABC_0;  // sfix18_En13
  output  signed [17:0] ABC_1;  // sfix18_En13
  output  signed [17:0] ABC_2;  // sfix18_En13


  wire signed [17:0] Inverse_Park_Transform_out1;  // sfix18_En10
  wire signed [17:0] Inverse_Park_Transform_out2;  // sfix18_En10
  wire signed [17:0] Inverse_Clarke_Transform_out1_0;  // sfix18_En13
  wire signed [17:0] Inverse_Clarke_Transform_out1_1;  // sfix18_En13
  wire signed [17:0] Inverse_Clarke_Transform_out1_2;  // sfix18_En13

  // Transform Coordinates dq to ABC
  // 
  // Converts the two coordinate time invariant system (dq) to a three-phase time and speed dependent system (ABC).


  // <S19>/Inverse_Park_Transform
  controllerHdl_Inverse_Park_Transform   u_Inverse_Park_Transform   (.direct_voltage(d),  // sfix18_En12
                                                                     .quadrature_voltage(q),  // sfix18_En12
                                                                     .sin_coefficient(sin),  // sfix18_En16
                                                                     .cos_coefficient(cos),  // sfix18_En16
                                                                     .alpha_voltage(Inverse_Park_Transform_out1),  // sfix18_En10
                                                                     .beta_voltage(Inverse_Park_Transform_out2)  // sfix18_En10
                                                                     );

  // <S19>/Inverse_Clarke_Transform
  controllerHdl_Inverse_Clarke_Transform   u_Inverse_Clarke_Transform   (.alpha_voltage(Inverse_Park_Transform_out1),  // sfix18_En10
                                                                         .beta_voltage(Inverse_Park_Transform_out2),  // sfix18_En10
                                                                         .phase_voltages_0(Inverse_Clarke_Transform_out1_0),  // sfix18_En13
                                                                         .phase_voltages_1(Inverse_Clarke_Transform_out1_1),  // sfix18_En13
                                                                         .phase_voltages_2(Inverse_Clarke_Transform_out1_2)  // sfix18_En13
                                                                         );

  assign ABC_0 = Inverse_Clarke_Transform_out1_0;

  assign ABC_1 = Inverse_Clarke_Transform_out1_1;

  assign ABC_2 = Inverse_Clarke_Transform_out1_2;

endmodule  // controllerHdl_Transform_dq_to_ABC

