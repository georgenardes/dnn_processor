import cv2
import os
import sys
import glob

def split_and_save_quadrants(image_path, output_directory):
    img = cv2.imread(image_path)
    if img is None:
        print(f"Error reading image: {image_path}")
        return

    height, width, _ = img.shape
    if height % 2 != 0 or width % 2 != 0:
        print(f"Image dimensions must be even for proper splitting: {image_path}")
        return

    half_height = height // 2
    half_width = width // 2

    quadrants = [
        img[:half_height, :half_width],
        img[:half_height, half_width:],
        img[half_height:, :half_width],
        img[half_height:, half_width:]
    ]

    original_name, extension = os.path.splitext(os.path.basename(image_path))

    for i, quadrant in enumerate(quadrants):
        quadrant_name = f"{original_name}_{i}{extension}"
        quadrant_path = os.path.join(os.path.dirname(output_directory), quadrant_name)
        cv2.imwrite(quadrant_path, quadrant)
        print(f"Quadrant {i} saved at: {quadrant_path}")

def process_images_in_directory(directory_path, output_directory):
    image_files = glob.glob(os.path.join(directory_path, '*.jpg'))
    image_files += glob.glob(os.path.join(directory_path, '*.jpeg'))

    if not image_files:
        print(f"No JPG images found in directory: {directory_path}")
        return

    for image_path in image_files:
        print(f"Processing image: {image_path}")
        split_and_save_quadrants(image_path, output_directory)

if __name__ == "__main__":

    images_directory = "dataset/test_set/acf_chap/"
    output_directory = "dataset/test_set_4x/acf_chap/"
    process_images_in_directory(images_directory, output_directory)
