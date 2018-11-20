`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 05.11.2018 09:42:25
// Design Name: 
// Module Name: ddr_reset
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 

// PL MIG Reset block has to wait for MMCM Lock before issuing a Reset, 
// otherwise MIG does not get reset properly and won't calibrate	
// 
//////////////////////////////////////////////////////////////////////////////////


module ddr_reset #(
    parameter COUNTER_MAX = 9181,
    parameter COUNTER_WIDTH = 15 )( 
   
    // inputs
    input                           clk_200,
    input                           sys_rst_i,
    input                           mmcm_locked,
    
    // outputs
    output                          sys_rst_o,
    output  [COUNTER_WIDTH-1:0]     debug_counter
    );
    
    // internal registers
    reg                             sys_rst_w;
    reg                             mmcm_locked_prev = 'b0;
    reg    [COUNTER_WIDTH-1:0]      sys_rst_counter = 'b0;
    reg                             reset_armed = 'b1;
    
    
    always @(posedge clk_200) begin
        
        mmcm_locked_prev <= mmcm_locked;                                                            // check mmcm lock signal state 
        
        if ( reset_armed == 1'b1 && mmcm_locked_prev == 1'b0  && mmcm_locked == 1'b1 ) begin        // mmcm_locked 0-> 1
            sys_rst_counter <= COUNTER_MAX;                                                         // load counter
            sys_rst_w <= 1'd0;                                                                    // activate reset -> 0    
        end 
        else if ( reset_armed == 1'b0 && mmcm_locked_prev == 1'b1  && mmcm_locked == 1'b0 ) begin   // mmcm_locked 1-> 0
           reset_armed <= 1'd1;                                                                     // stroe reset armed state
        end 
        else if ( sys_rst_counter == 1'b0 ) begin                                                   // counted down 
            sys_rst_w <= 1'd1;                                                                      // deactivate reset -> 1
        end 
        else begin
            sys_rst_w <= 1'd0;                                                                      // activate reset -> 0
            sys_rst_counter <= sys_rst_counter - 1'd1;                                              // count down
            
            if ( sys_rst_counter == 1'd1 ) begin
                reset_armed <= 1'd0;                                                                // clear reset armed state
            end
        end    
         
    end
    
    // For debug purpose only
    assign sys_rst_o = sys_rst_w;
    assign debug_counter = sys_rst_counter;
endmodule