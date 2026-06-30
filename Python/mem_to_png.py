import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

mem_file = "gray.mem"
output_image = "gray.png"

width = 512
height = 512

pixels = []

with open(mem_file, "r") as f:
    for line in f:
        value = line.strip()
        if value:
            pixels.append(int(value, 16))

expected_pixels = width * height

if len(pixels) != expected_pixels:
    raise ValueError(
        f"Pixel count mismatch! Expected {expected_pixels}, Found {len(pixels)}"
    )

image_array = np.array(pixels, dtype=np.uint8)
image_array = image_array.reshape((height, width))

img = Image.fromarray(image_array, mode="L")
img.save(output_image)

print(f"Image saved as: {output_image}")

plt.figure(figsize=(6, 6))
plt.imshow(img, cmap="gray")
plt.axis("off")
plt.title("Grayscale Image")
plt.show()
