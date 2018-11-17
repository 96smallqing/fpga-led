module led0_module
(
    CLK, RSTn, LED_Out
);

    input CLK;
    input RSTn;
    output LED_Out;
    
    /*************************************/
    
    parameter T5S = 28'd250_000_000;//DB4CE15开发板使用的晶振为50MHz，50M*5=250_000_000
    
    /*************************************/
    
    reg [27:0]Count1;
    
    always @ ( posedge CLK or negedge RSTn )
	    if( !RSTn )	
	        Count1 <= 28'd0;
	    else if( Count1 == T5S )
	        Count1 <= 28'd0;
	    else
	        Count1 <= Count1 + 1'b1;
	        
	/*************************************/
	
	reg rLED_Out;
	
	always @ ( posedge CLK or negedge RSTn )
        if( !RSTn ) 
            rLED_Out <= 1'b0;
        else if( Count1 >= 28'd0 && Count1 < 28'd50_000_000 )//在第0到一秒，led0亮
            rLED_Out <= 1'b1;
        else if( Count1 >=28'd50_000_000 && Count1 < 28'd100_000_000 ) //在第一到二秒，led0灭
            rLED_Out <= 1'b0;
		  else if( Count1 >=28'd100_000_000 && Count1 < 28'd150_000_000 )//在第二秒到点三秒led0亮
				rLED_Out <= 1'b1;
		  else if( Count1 >=28'd150_000_000 && Count1 < 28'd200_000_000 )//在第三秒到第四秒led0灭
				rLED_Out <= 1'b0;
		  else if( Count1 >=28'd200_000_000 && Count1 < 28'd250_000_000 )//同的第一步
            rLED_Out <= 1'b1;
     /***************************************/
     
     assign LED_Out = rLED_Out;
     
     /***************************************/
              
    
endmodule
