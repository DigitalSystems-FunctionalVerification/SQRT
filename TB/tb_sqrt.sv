
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

  DriverTransaction_s transaction = '{0, 1};
  Command_s           command;
  Command_s           commands[$];

  initial
  begin

    // Driver driver;    
    
    automatic logic               done = 1;             // Starts "done" and waits for a new command    

    // driver  = new(commands, transaction);

    commands.push_back('{1, 4});

    while (commands.size() < 1) begin end               // Waits for commands
        
    done = 0;                                           // Starts addressing received commands

    while (!done)                                       // Stops computing command if there is no more commands or received a stop command (command.header ==0)
    begin
        command = commands.pop_front();                 // Gets next command
        if (command.header == 1) begin                  // SQRT computing command
            #70
            transaction.value = command.value;          // Value to be computed
            transaction.rst   = 1;                      // Control signal for start of SQRT operation
        end else if (command.header == 0) begin         // Received stop command
            done = 1;                                   // Breaks the "while"
        end
        if(commands.size() < 1) done  = 1;              // No more commands stored
    end
  end
  
  // initial
  // begin

  //   val     <= transaction.value; 
  //   rst     <= transaction.rst;

  // end

  // initial
  // begin

  //   val <= 4; rst <= 0; #70;
  //   rst <= 1;

  // end

  always 
  begin
  
    val <= transaction.value; 
    rst <= transaction.rst;
    clk <= 1; #10;
    clk <= 0; #10;
    
  end

endmodule