// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\Detect_Change_To_One.v
// Created: 2014-08-28 10:13:58
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Detect_Change_To_One
// Source Path: controllerPeripheralHdlAdi/Encoder_Peripheral_Hardware_Specification/Detect Change To One
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Detect_Change_To_One
          (
           CLK_IN,
           reset,
           enb,
           In1,
           Out1
          );


  input   CLK_IN;
  input   reset;
  input   enb;
  input   In1;
  output  Out1;


  reg  Unit_Delay_out1;
  wire Unit_Delay_out1_1;
  wire In1_1;


  // <S6>/Unit Delay
  always @(posedge CLK_IN)
    begin : Unit_Delay_process
      if (reset == 1'b1) begin
        Unit_Delay_out1 <= 1'b0;
      end
      else if (enb) begin
        Unit_Delay_out1 <= In1;
      end
    end



  // <S6>/Logical Operator
  assign Unit_Delay_out1_1 =  ~ Unit_Delay_out1;



  // <S6>/Logical Operator1
  assign In1_1 = In1 & Unit_Delay_out1_1;



  assign Out1 = In1_1;

endmodule  // Detect_Change_To_One

