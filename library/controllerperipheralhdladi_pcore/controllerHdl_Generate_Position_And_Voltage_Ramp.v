// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_Generate_Position_And_Voltage_Ramp.v
// Created: 2014-08-27 21:15:34
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_Generate_Position_And_Voltage_Ramp
// Source Path: controllerHdl/Field_Oriented_Control/Open_Loop_Control/Generate_Position_And_Voltage_Ramp
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_Generate_Position_And_Voltage_Ramp
          (
           CLK_IN,
           reset,
           enb_1_2000_0,
           Reset_1,
           target_velocity,
           param_open_loop_bias,
           param_open_loop_scalar,
           Q_Voltage,
           Position
          );


  input   CLK_IN;
  input   reset;
  input   enb_1_2000_0;
  input   Reset_1;
  input   signed [17:0] target_velocity;  // sfix18_En8
  input   signed [17:0] param_open_loop_bias;  // sfix18_En14
  input   signed [17:0] param_open_loop_scalar;  // sfix18_En16
  output  signed [17:0] Q_Voltage;  // sfix18_En12
  output  signed [17:0] Position;  // sfix18_En14


  wire signed [31:0] rotor_velocity;  // sfix32_En22
  wire signed [17:0] volts_dt;  // sfix18_En12
  wire signed [17:0] electrical_velocity;  // sfix18_En6
  wire signed [17:0] electrical_position;  // sfix18_En14

  // Generate Position And Voltage


  // <S17>/Rotor_Acceleration_To_Velocity
  controllerHdl_Rotor_Acceleration_To_Velocity   u_Rotor_Acceleration_To_Velocity   (.CLK_IN(CLK_IN),
                                                                                     .reset(reset),
                                                                                     .enb_1_2000_0(enb_1_2000_0),
                                                                                     .Reset_1(Reset_1),
                                                                                     .Vel_Target(target_velocity),  // sfix18_En8
                                                                                     .RV(rotor_velocity)  // sfix32_En22
                                                                                     );

  // <S17>/Frequency_To_Volts
  controllerHdl_Frequency_To_Volts   u_Frequency_To_Volts   (.F(rotor_velocity),  // sfix32_En22
                                                             .param_open_loop_bias(param_open_loop_bias),  // sfix18_En14
                                                             .param_open_loop_scalar(param_open_loop_scalar),  // sfix18_En16
                                                             .V(volts_dt)  // sfix18_En12
                                                             );

  assign Q_Voltage = volts_dt;

  // <S17>/Rotor_To_Electical_Velocity
  controllerHdl_Rotor_To_Electical_Velocity   u_Rotor_To_Electical_Velocity   (.RV(rotor_velocity),  // sfix32_En22
                                                                               .EV(electrical_velocity)  // sfix18_En6
                                                                               );

  // <S17>/Electrical_Velocity_To_Position
  controllerHdl_Electrical_Velocity_To_Position   u_Electrical_Velocity_To_Position   (.CLK_IN(CLK_IN),
                                                                                       .reset(reset),
                                                                                       .enb_1_2000_0(enb_1_2000_0),
                                                                                       .Reset_1(Reset_1),
                                                                                       .EV(electrical_velocity),  // sfix18_En6
                                                                                       .EP(electrical_position)  // sfix18_En14
                                                                                       );

  assign Position = electrical_position;

endmodule  // controllerHdl_Generate_Position_And_Voltage_Ramp

