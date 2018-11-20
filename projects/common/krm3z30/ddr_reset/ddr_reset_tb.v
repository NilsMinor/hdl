//`timescale 1ns / 1ps

// 
// Testbench for ddr3 PL reset module
//
//

module ddr_reset_tb( );
   
    reg clk_200;
    reg sys_rst_i;
    wire sys_rst_o;
    reg mmcm_locked;
    wire [15:0]debug_counter;
    
    ddr_reset #(.COUNTER_MAX(9181), .COUNTER_WIDTH(16)) DUT(
        .clk_200( clk_200 ),
        .sys_rst_i( sys_rst_i ),
        .sys_rst_o( sys_rst_o ),
        .mmcm_locked( mmcm_locked ),
        .debug_counter( debug_counter )
    ); 
    
    initial begin 
        clk_200 = 'b0;
        sys_rst_i = 'b0;
        mmcm_locked = 'b0;  // mmcm_locked 0->1
        #1000
        mmcm_locked = 'b1;  // mmcm_locked 1->0
        #2000
        mmcm_locked = 'b0;  
        #100000 $finish;
    end
    
    always #2.5 clk_200 =~clk_200;      // generate 200MHz clock
     
   // $display ("Run ddr_reset testbench");
endmodule
