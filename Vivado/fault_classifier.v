`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 12:24:24
// Design Name: 
// Module Name: fault_classifier
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


module fault_classifier (
    input  signed [15:0] Vc_peak,
    input  signed [15:0] Ic_peak,
    output reg    [2:0]  fault_type
);

    // Fault codes
    localparam NORMAL = 3'b000;
    localparam FAULT1 = 3'b001;

    always @(*) begin
        // Default
        fault_type = NORMAL;

        // Decision Tree Logic (Frozen ML Model)
        if (Vc_peak <= 16'd4853) begin
            fault_type = NORMAL;
        end
        else begin
            if (Ic_peak > 16'd31396) begin
                fault_type = FAULT1;
            end
            else begin
                fault_type = NORMAL;
            end
        end
    end

endmodule

