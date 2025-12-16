`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 12:25:17
// Design Name: 
// Module Name: tb
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
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module tb;

    reg signed [15:0] Vc_peak;
    reg signed [15:0] Ic_peak;
    wire [2:0] fault_type;

    // Instantiate DUT
    fault_classifier dut (
        .Vc_peak(Vc_peak),
        .Ic_peak(Ic_peak),
        .fault_type(fault_type)
    );

    initial begin
        // Case 1: NORMAL
        Vc_peak = 16'd3000;
        Ic_peak = 16'd10000;
        #10;

        // Case 2: Still NORMAL
        Vc_peak = 16'd4500;
        Ic_peak = 16'd20000;
        #10;

        // Case 3: FAULT
        Vc_peak = 16'd6000;
        Ic_peak = 16'd32000;
        #10;

        // Case 4: Edge case
        Vc_peak = 16'd4854;
        Ic_peak = 16'd31400;
        #10;

        $finish;
    end

endmodule

