from PIL import Image
input_image = "/content/RGB.bmp"       
output_mem = "/content/RGB.mem"
img = Image.open(input_image).convert("RGB")
width, height = img.size

print(f"Image Size: {width} x {height}")
with open(output_mem, "w") as f:
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))

            # Write RGB as 24-bit hexadecimal (RRGGBB)
            f.write(f"{r:02X}{g:02X}{b:02X}\n")

print(f"\nConversion completed successfully!")
print(f"Output file: {output_mem}")
