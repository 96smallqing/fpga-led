module led3_module
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
        else if( Count1 >= 28'd0 && Count1 < 28'd50_000_000 )//在第一秒，亮
            rLED_Out <= 1'b1;
        else if( Count1 >=28'd50_000_000 && Count1 < 28'd137_500_000 ) //在第一到二又四分之三秒，灭
            rLED_Out <= 1'b0;
		  else if( Count1 >=28'd137_500_000 && Count1 < 28'd187_500_000 )//在二又四分之三到三又四分之三秒亮
				rLED_Out <= 1'b1;
		  else if( Count1 >=28'd187_500_000 && Count1 < 28'd200_000_000 )//三又四分之三到四秒灭
				rLED_Out <= 1'b0;
		  else if( Count1 >=28'd200_000_000 && Count1 < 28'd250_000_000 )//四到五秒灭
            rLED_Out <= 1'b1;
            
     /***************************************/
     
     assign LED_Out = rLED_Out;
     
     /***************************************/
              
    
endmodule
