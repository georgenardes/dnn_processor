import cv2
import numpy as np
import os
import sys
import random
import glob

def find_largest_square_region(frame):
    height, width, _ = frame.shape
    max_size = min(height, width)
    top = random.randint(0, max(0, height - max_size))
    left = random.randint(0, max(0, width - max_size))
    bottom = top + max_size
    right = left + max_size
    square_region = frame[top:bottom, left:right]
    resized_square_region = cv2.resize(square_region, (256, 256))
    return resized_square_region

def process_image(input_path, frame_count):
    img = cv2.imread(input_path)
    if img is None:
        print(f"Error reading image: {input_path}")
        return

    # Check if the image is already 256x256
    if img.shape[0] == 256 and img.shape[1] == 256:
        print(f"Ignoring image {input_path}, as it already has dimensions 256x256.")
        return

    region = find_largest_square_region(img)
    if region is not None:
        output_name = input_path.split(os.path.sep)[-1].split('.')[0] + str(frame_count) + ".jpg"
        output_path = os.path.join(os.path.dirname(input_path), output_name)
        cv2.imwrite(output_path, region)
        print(f"Crop saved at: {output_path}")

        # Delete the old image
        os.remove(input_path)
        print(f"Old image deleted: {input_path}")

def process_images_in_directory(directory_path):
    image_files = glob.glob(os.path.join(directory_path, '*.jpeg')) + \
                  glob.glob(os.path.join(directory_path, '*.jpg')) + \
                  glob.glob(os.path.join(directory_path, '*.png'))

    if not image_files:
        print(f"No images found in directory: {directory_path}")
        return

    for image_path in image_files:
        print(f"Processing image: {image_path}")
        process_image(image_path, frame_count=0)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <directory_with_images>")
    else:
        images_directory = sys.argv[1]
        process_images_in_directory(images_directory)
