`timescale 1ns / 1ps


module tb_Vending_Machine;
   //inputs
   reg CLK;
   reg RESET;
   reg START;
   reg CANCEL;
   reg [2:0] PRODUCT_CODE;
   reg ONLINE_PAYMENT;
   reg COIN_5;
   reg COIN_10;
   //outputs
   wire [3:0] OUT_STATE;      
   wire       DISPENSE_PRODUCT;
   wire [6:0] RETURN_CHANGE;
   wire [6:0] PRODUCT_PRICE ; 
   
   //clock generation
   always begin
     #5 CLK = ~CLK;
   end
     
   initial begin
   
      CLK            =   1'b0;
      RESET          =   1'b1;
      START          =   1'b0;
      CANCEL         =   1'b0;
      COIN_5         =   1'b0;
      COIN_10        =   1'b0;
      ONLINE_PAYMENT =      0;
      PRODUCT_CODE   = 3'b000;
      
      //Remove RESET
      #100 RESET     =   1'b0;
      #100;
      
      //coke dispense with online payment
      START          =   1'b1;
      #10; 
      START          =   1'b0;
      ONLINE_PAYMENT =   1'b1;
      #10;
      ONLINE_PAYMENT =   1'b0;
      
      #50;
      START          =   1'b1;
      PRODUCT_CODE   = 3'b001;  //pepsi
      #20 START      =   1'b0;
      //insert 5 rupees
      COIN_5         =   1'b1;
      #10;
      COIN_5         =   1'b0;
      #20;
      //insert 10 rupees coin
      COIN_10        =   1'b1;
      #10;
      COIN_10        =   1'b0;
      #20;
      //cancel
      CANCEL         =   1'b1;
      #20;
      CANCEL         =   1'b0;
     
      
      //pepsi dispense with online payment
      #50;
      START          =   1'b1;
      #10; 
      START          =   1'b0;
      ONLINE_PAYMENT =   1'b1;
      #10;
      ONLINE_PAYMENT =   1'b0;
      
      #50;
      START          =   1'b1;
      PRODUCT_CODE   = 3'b010;  //water_bottle
      #20 START      =   1'b0;
      //insert 5 rupees coin for testing return change
      COIN_5         =   1'b1;
      #10;
      COIN_5         =   1'b0;
      #20;
      //insert 10 rupees coin
      COIN_10        =   1'b1;
      #10;
      COIN_10        =   1'b0;
      
      
      //water bottle dispense with online payment
      #50;
      START          =   1'b1;
      #10; 
      START          =   1'b0;
      ONLINE_PAYMENT =   1'b1;
      #10;
      ONLINE_PAYMENT =   1'b0;
      
      #50;
      START          =   1'b1;
      PRODUCT_CODE   = 3'b011;  //cofee
      #20 START      =   1'b0;
      //insert 5 rupees
      COIN_5         =   1'b1;
      #10;
      COIN_5         =   1'b0;
      #20;
      //insert 10 rupees coin
      COIN_10        =   1'b1;
      #10;
      COIN_10        =   1'b0;
      #20;
      //insert 10 rupees coin
      COIN_10        =   1'b1;
      #10;
      COIN_10        =   1'b0;
      
      #50;
      START = 1'b1;
      PRODUCT_CODE = 3'b011;   // Coffee (₹25)
      #20;
      START = 1'b0;
      
      // Insert only ₹10
      COIN_10 = 1'b1;
      #10;
      COIN_10 = 1'b0;
      
      // Wait and observe
      #100;
      
      
      #100;
      $finish;
      
   end   
   //monitoring
   initial begin
    $monitor(
        "T=%0t State=%0d Coin=%0d Price=%0d r_next_change=%0d r_change=%0d OutChange=%0d",
        $time,
        VM.present_state,
        VM.total_coin_value,
        VM.r_product_price,
        VM.r_next_return_change,
        VM.r_return_change,
        RETURN_CHANGE
    );
end

   //DUT
   Vending_Machine VM(
      .clk(CLK),            
      .reset(RESET),                    
      .start(START),          
      .cancel(CANCEL),         
      .product_code(PRODUCT_CODE),   
      .online_payment(ONLINE_PAYMENT), 
      .coin_5(COIN_5),         
      .coin_10(COIN_10),
      .out_state(OUT_STATE),       
      .dispense_product(DISPENSE_PRODUCT),
      .return_change(RETURN_CHANGE),   
      .product_price(PRODUCT_PRICE)
      );              
endmodule
