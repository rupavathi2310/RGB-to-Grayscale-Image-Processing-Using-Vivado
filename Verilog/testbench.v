module tb_rgb2gray;
    parameter IMAGE_SIZE = 50496;
    reg [23:0] image_mem [0:50495];
    reg [23:0] pixel;
    wire [7:0] gray;
    integer i;
    integer file;

    rgb2gray DUT(.rgb(pixel), .gray(gray));

    initial begin
        $readmemh("gray.mem", image_mem);
        $display("Pixel0 = %h", image_mem[0]);
        $display("Pixel1 = %h", image_mem[1]);
        $display("Pixel2 = %h", image_mem[2]);
        
        $display("First 5 pixels from file:");
        for(i=0; i<5; i=i+1)
            $display("Pixel[%0d] = %h", i, image_mem[i]);

        file = $fopen("C:/Users/rgukt/OneDrive/Documents/rupa.mem", "w");
        if(file == 0)
        begin
            $display("Cannot create gray.hex");
            $finish;
        end

        for(i=0; i<IMAGE_SIZE; i=i+1)
        begin
            pixel = image_mem[i]; #1;
            if(i < IMAGE_SIZE)
                $display("RGB=%h Gray=%h", pixel, gray);
            $fwrite(file, "%02h\n", gray);
        end

        $fclose(file);
        $display("gray.hex generated successfully");
        $finish;
    end
endmodule
