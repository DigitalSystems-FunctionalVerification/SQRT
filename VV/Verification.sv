package Verification;

    typedef struct {
        
        int header;
        int value;

    } Command_s;

    typedef struct {
        
        logic   rst;
        int     value;

    } DriverTransaction_s;
    
    class Driver;

        Command_s           commands[$];
        DriverTransaction_s driver_transaction;


        // new
        function new();
        endfunction //new()

        // AddCommand
        function AddCommand(Command_s command);
            
            commands.push_back(command);
            
        endfunction

        // ExecuteCommands
        // In Verilog-2001 you can specify that tasks, functions, and modules use automatic storage, which causes the simulator to use the stack for local variables.
        task automatic ExecuteCommands();

            logic done = 1;                                             // Starts "done" and waits for a new command
            Command_s command;

            while (this.commands.size() < 1) begin end                  // Waits for commands
                
            done = 0;                                                   // Starts addressing received commands

            while (!done)                                               // Stops computing command if there is no more commands or received a stop command (command.header ==0)
            begin
                command = this.commands.pop_front();                    // Gets next command
                if (command.header == 1) begin                          // SQRT computing command
                    this.driver_transaction.value   = command.value;    // Value to be computed
                    this.driver_transaction.rst     = 1;                // Control signal for start of SQRT operation
                end else if (command.header == 0) begin                 // Received stop command
                    done = 1;                                           // Breaks the "while"
                end
                if(this.commands.size() < 1) done  = 1;                 // No more commands stored
            end
            
        endtask //ExecuteCommands

    endclass //Driver
    
endpackage