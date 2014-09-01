// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_controllerHdl.v
// Created: 2014-08-27 21:15:34
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_controllerHdl
// Source Path: controllerHdl
// Hierarchy Level: 1
// 
// Simulink model description for controllerHdl:
// 
// Controller Algorithm for Permanent Magnet Synchronous Machine
// 
// Specifies controller software component for Permanent Magnet Synchronous Machine (PMSM) using Field-Oriented Control.
// The sensors bus/structure contains values returned by the Analog to Digital Converter (ADC) and quadrature encoder peripherals.
// The controller outputs compare values used by the Pulse Width Modulators (PWMs) to generate the phase voltages.
// 
// Simulink subsystem description for controllerHdl:
// 
// Controller Algorithm for Permanent Magnet Synchronous Machine
// 
// Specifies controller software component for Permanent Magnet Synchronous Machine (PMSM) using Field-Oriented Control.
// The sensors bus/structure contains values returned by the Analog to Digital Converter (ADC) and quadrature encoder peripherals.
// The controller outputs compare values used by the Pulse Width Modulators (PWMs) to generate the phase voltages.
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_controllerHdl
          (
           CLK_IN,
           reset,
           enb_1_2000_0,
           adc_current_0,
           adc_current_1,
           encoder_valid,
           encoder_count,
           controller_mode,
           command,
           param_velocity_p_gain,
           param_velocity_i_gain,
           param_current_p_gain,
           param_current_i_gain,
           param_open_loop_bias,
           param_open_loop_scalar,
           param_encoder_zero_offset,
           pwm_compare_0,
           pwm_compare_1,
           pwm_compare_2,
           phase_voltages_0,
           phase_voltages_1,
           phase_voltages_2,
           phase_currents_0,
           phase_currents_1,
           rotor_position,
           electrical_position,
           rotor_velocity,
           dq_currents_0,
           dq_currents_1,
           electrical_position_err_reg
          );


  input   CLK_IN;
  input   reset;
  input   enb_1_2000_0;
  input   signed [17:0] adc_current_0;  // sfix18_En17
  input   signed [17:0] adc_current_1;  // sfix18_En17
  input   encoder_valid;
  input   [15:0] encoder_count;  // uint16
  input   [1:0] controller_mode;  // ufix2
  input   signed [17:0] command;  // sfix18_En8
  input   signed [17:0] param_velocity_p_gain;  // sfix18_En16
  input   signed [17:0] param_velocity_i_gain;  // sfix18_En15
  input   signed [17:0] param_current_p_gain;  // sfix18_En10
  input   signed [17:0] param_current_i_gain;  // sfix18_En2
  input   signed [17:0] param_open_loop_bias;  // sfix18_En14
  input   signed [17:0] param_open_loop_scalar;  // sfix18_En16
  input   signed [17:0] param_encoder_zero_offset;  // sfix18_En14
  output  [15:0] pwm_compare_0;  // uint16
  output  [15:0] pwm_compare_1;  // uint16
  output  [15:0] pwm_compare_2;  // uint16
  output  signed [19:0] phase_voltages_0;  // sfix20_En12
  output  signed [19:0] phase_voltages_1;  // sfix20_En12
  output  signed [19:0] phase_voltages_2;  // sfix20_En12
  output  signed [17:0] phase_currents_0;  // sfix18_En15
  output  signed [17:0] phase_currents_1;  // sfix18_En15
  output  signed [17:0] rotor_position;  // sfix18_En14
  output  signed [17:0] electrical_position;  // sfix18_En14
  output  signed [17:0] rotor_velocity;  // sfix18_En8
  output  signed [17:0] dq_currents_0;  // sfix18_En15
  output  signed [17:0] dq_currents_1;  // sfix18_En15
  output  signed [18:0] electrical_position_err_reg;  // sfix19_En14


  wire Encoder_To_Position_And_Velocity_out1;
  wire signed [17:0] Encoder_To_Position_And_Velocity_out2;  // sfix18_En14
  wire signed [17:0] Encoder_To_Position_And_Velocity_out3;  // sfix18_En14
  wire signed [17:0] Encoder_To_Position_And_Velocity_out4;  // sfix18_En8
  wire signed [17:0] phase_currents_0_1;  // sfix18_En15
  wire signed [17:0] phase_currents_1_1;  // sfix18_En15
  wire signed [17:0] phase_currents [0:1];  // sfix18_En15 [2]
  wire signed [19:0] Field_Oriented_Control_out1_0;  // sfix20_En12
  wire signed [19:0] Field_Oriented_Control_out1_1;  // sfix20_En12
  wire signed [19:0] Field_Oriented_Control_out1_2;  // sfix20_En12
  wire signed [17:0] Field_Oriented_Control_out2_0;  // sfix18_En15
  wire signed [17:0] Field_Oriented_Control_out2_1;  // sfix18_En15
  wire signed [17:0] Field_Oriented_Control_out3;  // sfix18_En14
  wire [15:0] pwm_compare_0_1;  // uint16
  wire [15:0] pwm_compare_1_1;  // uint16
  wire [15:0] pwm_compare_2_1;  // uint16
  wire [15:0] pwm_compare [0:2];  // uint16 [3]
  wire signed [18:0] Add_sub_cast;  // sfix19_En14
  wire signed [18:0] Add_sub_cast_1;  // sfix19_En14
  wire signed [18:0] Add_out1;  // sfix19_En14
  wire signed [18:0] MATLAB_Function_out1;  // sfix19_En14

  // Controller HDL
  // 
  // Copyright 2013 The MathWorks, Inc.


  // <Root>/Encoder_To_Position_And_Velocity
  controllerHdl_Encoder_To_Position_And_Velocity   u_Encoder_To_Position_And_Velocity   (.CLK_IN(CLK_IN),
                                                                                         .reset(reset),
                                                                                         .enb_1_2000_0(enb_1_2000_0),
                                                                                         .encoder_valid(encoder_valid),
                                                                                         .encoder_counter(encoder_count),  // uint16
                                                                                         .param_zero_offset(param_encoder_zero_offset),  // sfix18_En14
                                                                                         .position_valid(Encoder_To_Position_And_Velocity_out1),
                                                                                         .rotor_position(Encoder_To_Position_And_Velocity_out2),  // sfix18_En14
                                                                                         .electrical_position(Encoder_To_Position_And_Velocity_out3),  // sfix18_En14
                                                                                         .rotor_velocity(Encoder_To_Position_And_Velocity_out4)  // sfix18_En8
                                                                                         );

  // <Root>/ADC_Peripheral_To_Phase_Current
  controllerHdl_ADC_Peripheral_To_Phase_Current   u_ADC_Peripheral_To_Phase_Current   (.adc_0(adc_current_0),  // sfix18_En17
                                                                                       .adc_1(adc_current_1),  // sfix18_En17
                                                                                       .phase_currents_0(phase_currents_0_1),  // sfix18_En15
                                                                                       .phase_currents_1(phase_currents_1_1)  // sfix18_En15
                                                                                       );

  assign phase_currents[0] = phase_currents_0_1;
  assign phase_currents[1] = phase_currents_1_1;

  // <Root>/Field_Oriented_Control
  controllerHdl_Field_Oriented_Control   u_Field_Oriented_Control   (.CLK_IN(CLK_IN),
                                                                     .reset(reset),
                                                                     .enb_1_2000_0(enb_1_2000_0),
                                                                     .controller_mode(controller_mode),  // ufix2
                                                                     .command(command),  // sfix18_En8
                                                                     .electrical_postion(Encoder_To_Position_And_Velocity_out3),  // sfix18_En14
                                                                     .rotor_velocity(Encoder_To_Position_And_Velocity_out4),  // sfix18_En8
                                                                     .phase_currents_0(phase_currents[0]),  // sfix18_En15
                                                                     .phase_currents_1(phase_currents[1]),  // sfix18_En15
                                                                     .param_velocity_p_gain(param_velocity_p_gain),  // sfix18_En16
                                                                     .param_velocity_i_gain(param_velocity_i_gain),  // sfix18_En15
                                                                     .param_current_p_gain(param_current_p_gain),  // sfix18_En10
                                                                     .param_current_i_gain(param_current_i_gain),  // sfix18_En2
                                                                     .param_open_loop_bias(param_open_loop_bias),  // sfix18_En14
                                                                     .param_open_loop_scalar(param_open_loop_scalar),  // sfix18_En16
                                                                     .phase_voltages_0(Field_Oriented_Control_out1_0),  // sfix20_En12
                                                                     .phase_voltages_1(Field_Oriented_Control_out1_1),  // sfix20_En12
                                                                     .phase_voltages_2(Field_Oriented_Control_out1_2),  // sfix20_En12
                                                                     .dq_current_0(Field_Oriented_Control_out2_0),  // sfix18_En15
                                                                     .dq_current_1(Field_Oriented_Control_out2_1),  // sfix18_En15
                                                                     .electrical_position_ol(Field_Oriented_Control_out3)  // sfix18_En14
                                                                     );

  // <Root>/Phase_Voltages_To_Compare_Values
  controllerHdl_Phase_Voltages_To_Compare_Values   u_Phase_Voltages_To_Compare_Values   (.V_0(Field_Oriented_Control_out1_0),  // sfix20_En12
                                                                                         .V_1(Field_Oriented_Control_out1_1),  // sfix20_En12
                                                                                         .V_2(Field_Oriented_Control_out1_2),  // sfix20_En12
                                                                                         .C_0(pwm_compare_0_1),  // uint16
                                                                                         .C_1(pwm_compare_1_1),  // uint16
                                                                                         .C_2(pwm_compare_2_1)  // uint16
                                                                                         );

  assign pwm_compare[0] = pwm_compare_0_1;
  assign pwm_compare[1] = pwm_compare_1_1;
  assign pwm_compare[2] = pwm_compare_2_1;

  assign pwm_compare_0 = pwm_compare[0];

  assign pwm_compare_1 = pwm_compare[1];

  assign pwm_compare_2 = pwm_compare[2];

  assign phase_voltages_0 = Field_Oriented_Control_out1_0;

  assign phase_voltages_1 = Field_Oriented_Control_out1_1;

  assign phase_voltages_2 = Field_Oriented_Control_out1_2;

  assign phase_currents_0 = phase_currents[0];

  assign phase_currents_1 = phase_currents[1];

  assign rotor_position = Encoder_To_Position_And_Velocity_out2;

  assign electrical_position = Encoder_To_Position_And_Velocity_out3;

  assign rotor_velocity = Encoder_To_Position_And_Velocity_out4;

  assign dq_currents_0 = Field_Oriented_Control_out2_0;

  assign dq_currents_1 = Field_Oriented_Control_out2_1;

  // <Root>/Add
  assign Add_sub_cast = Field_Oriented_Control_out3;
  assign Add_sub_cast_1 = Encoder_To_Position_And_Velocity_out3;
  assign Add_out1 = Add_sub_cast - Add_sub_cast_1;



  // <Root>/MATLAB Function
  controllerHdl_MATLAB_Function_block3   u_MATLAB_Function   (.CLK_IN(CLK_IN),
                                                              .reset(reset),
                                                              .enb_1_2000_0(enb_1_2000_0),
                                                              .u(Add_out1),  // sfix19_En14
                                                              .y(MATLAB_Function_out1)  // sfix19_En14
                                                              );

  assign electrical_position_err_reg = MATLAB_Function_out1;

endmodule  // controllerHdl_controllerHdl

