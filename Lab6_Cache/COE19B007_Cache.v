//Cache Memory Module
module cache_memory(Phyiscal_Address);
    input [21:0] Phyiscal_Address;
    reg [7:0] tag ;
    reg [9:0] Line_Number;
    reg [3:0] word;

    reg [1031:0] cache [1023:0];
    reg [1023:0] main_memory[262143:0];
    reg [9:0] temp;
    reg [17:0] main_block;
    reg [7:0] tag_fill;
    reg [1031:0] cache_check;
    // reg [3:0] memory;
    always @(Phyiscal_Address)
    begin
        tag = Phyiscal_Address[21:14];
        Line_Number = Phyiscal_Address[13:4];
        word = Phyiscal_Address[3:0];
        // memory = Phyiscal_Address[15:12];
        cache_check = cache[Line_Number];
        if(tag == cache_check[1031:1024])
        begin
            $display("Cache hit has occured!!!!!!!!!!!!");
            $display("tag = %d line number = %d  word = %b\n",tag,Line_Number,word);
        end
        else 
        begin
            main_block = Phyiscal_Address[21:4];
            // main_memory[main_block] = memory + 1;
            temp = main_block % 1024;
            tag_fill = main_block / 1024;
            cache[temp] = {tag_fill,main_memory[main_block]};
            $display("Cache miss and loaded from main memory!!!!!!!!!");
            $display("tag = %d line number = %d  word = %b",tag_fill,temp,word);
            // $display("cache[%d] = %b",temp,cache[temp]);
            $display("Main_Memory_Block = %d\n",main_block);
        end  
    end
endmodule
//Test bench module for cache memory
module test;
    reg [21:0] Phyiscal_Address;

    cache_memory c1(Phyiscal_Address);
    initial begin
        #0  Phyiscal_Address  = 22'b0001001110001000001001;
        #10 Phyiscal_Address  = 22'b0011001010101000001001;
        #20 Phyiscal_Address  = 22'b0001101110101000001011;
        #30 Phyiscal_Address  = 22'b0001001110001000001001;
        #40 Phyiscal_Address  = 22'b0011001010001000001011;
        #50 Phyiscal_Address  = 22'b0001101110101000001010;
        #60 Phyiscal_Address  = 22'b0001001111101000001001;
        #70 Phyiscal_Address  = 22'b0001001110001000001101;
        #80 Phyiscal_Address  = 22'b0001001111101000001011;
        
    end
endmodule 