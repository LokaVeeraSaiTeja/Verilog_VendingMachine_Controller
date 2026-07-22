`timescale 1ns / 1ps

module Vending_Machine #(
    parameter water_bottle_price = 7'd10,
    parameter coke_price         = 7'd20,
    parameter pepsi_price        = 7'd15,
    parameter coffee_price       = 7'd25
)
(
    input  wire       clk,
    input  wire       reset,

    // Inputs
    input  wire       start,
    input  wire       cancel, 
    input  wire [2:0] product_code,
    input  wire       online_payment,
    input wire        coin_5,
    input wire        coin_10,

    // Outputs
    output wire [3:0] out_state,
    output wire       dispense_product,
    output wire [6:0] return_change,
    output wire [6:0] product_price
);

    // State Encoding
    localparam initial_state= 4'b0000,
               select_product_state   = 4'b0001,
               coke_selection_state   = 4'b0010,
               pepsi_selection_state  = 4'b0011,
               water_selection_state  = 4'b0100,
               coffee_selection_state = 4'b0101,
               dispense_return_state  = 4'b0110;

    // Registers
    reg [3:0] present_state, next_state;

    reg [6:0] r_return_change;
    reg [6:0] r_next_return_change;

    reg [6:0] r_product_price;
    reg [6:0] r_next_product_price;
    
    reg [6:0] total_coin_value;
    reg [6:0] next_total_coin_value;

    // Sequential Block
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            present_state        <= initial_state;
            r_return_change      <= 7'd0;
            r_product_price      <= 7'd0;
            total_coin_value     <= 7'd0;
        end
        else
        begin
            present_state        <= next_state;
            r_return_change      <= r_next_return_change;
            r_product_price      <= r_next_product_price;
            total_coin_value    <= next_total_coin_value;
        end
    end

    // Next State Logic
    always @(*)
    begin

        // Default assignments
        next_state            = present_state;
        r_next_return_change  = r_return_change;
        r_next_product_price  = r_product_price;
        next_total_coin_value = total_coin_value;
        
        case (present_state)

        // Initial State
        initial_state:
        begin
            r_next_return_change = 7'd0;
            r_next_product_price = 7'd0;

            if (start)
                next_state = select_product_state;
            else
                next_state = initial_state;
        end
        
        // Product Selection        
        select_product_state:
        begin

            case (product_code)

                3'b000:
                begin
                    next_state = coke_selection_state;
                    r_next_product_price = coke_price;
                end

                3'b001:
                begin
                    next_state = pepsi_selection_state;
                    r_next_product_price = pepsi_price;
                end

                3'b010:
                begin
                    next_state = water_selection_state;
                    r_next_product_price = water_bottle_price;
                end

                3'b011:
                begin
                    next_state = coffee_selection_state;
                    r_next_product_price = coffee_price;
                end

                default:
                begin
                    next_state = initial_state;
                    r_next_product_price = 7'd0;
                end

            endcase
        end

        // Waiting for Payment
        coke_selection_state,
        pepsi_selection_state,
        water_selection_state,
        coffee_selection_state:
        begin
            
            
             
            if (cancel)
            begin
                next_state = initial_state;
                r_next_return_change = total_coin_value;
                next_total_coin_value = 7'd0;
                r_next_product_price = 7'd0;
            end
             
           else begin
           
            case ({coin_10, coin_5})

             2'b01:
              next_total_coin_value = total_coin_value + 7'd5;

             2'b10:
              next_total_coin_value = total_coin_value + 7'd10;
              
             2'b11:
              next_total_coin_value = total_coin_value; // Invalid: both coins inserted simultaneously

             default:
              next_total_coin_value = total_coin_value;

           endcase

            if (online_payment)
            begin
                next_state = dispense_return_state;
            end

            else if (next_total_coin_value >= r_product_price)
            begin
                
              next_state = dispense_return_state;
            end

            else
            begin
                next_state = present_state;
            end
          end
        end

        // Dispense State   
        dispense_return_state:
        begin
            if (online_payment)
            begin
                r_next_return_change = 7'd0;
            end
            else
            begin
                r_next_return_change = total_coin_value - r_product_price;
            end
            next_state = initial_state;
            next_total_coin_value = 7'd0;
            r_next_product_price = 7'd0;

        end

        // Default
        default:
        begin
            next_state           = initial_state;
            r_next_return_change = 7'd0;
            r_next_product_price = 7'd0;
            next_total_coin_value = 7'd0;
        end

        endcase

    end

    // Output Logic
    assign out_state = present_state;

    assign dispense_product =
           (present_state == dispense_return_state);

    assign return_change = r_return_change;

    assign product_price = r_product_price;

endmodule