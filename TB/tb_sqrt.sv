
`timescale 1ns/1ns

`include "../VV/Verification.sv"
module tb_sqrt_svl;

  import Verification::*;

  //variable declarations
  logic clk, rst, eop;
  logic[15:0] val;
  logic[ 7:0] out;

  //mapping
  sqrt sqrt_mod(
    .clock(clk),
    .reset(rst),
    .endop(eop),
    .valor(val),
    .sqrt(out)
  );  

  Driver              driver;    
  DriverTransaction_s transaction = '{0, 1};
  Command_s           command;
  Command_s           commands[$];

  initial
  begin

    automatic logic               done = 1;             // Starts "done" and waits for a new command    
    driver  = new(commands, transaction);

    // "Agent"
    driver.AddCommand('{1, 4});
    driver.AddCommand('{1, 16});
    driver.AddCommand('{1, 25});
    driver.AddCommand('{1, 36});
    driver.AddCommand('{1, 49});
    driver.AddCommand('{1, 225});
    driver.AddCommand('{0, 225});

    driver.ExecuteCommands();

  end

  always 
  begin
  
    val <= driver.transaction.value; 
    rst <= driver.transaction.rst;

    clk <= 1; #10;
    clk <= 0; #10;
    
  end

endmodule
