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

    half_half_width = half_width // 2
    half_half_height = half_height // 2

    quadrants = [
        img[:half_height, :half_width],
        img[:half_height, half_width:],
        img[half_height:, :half_width],
        img[half_height:, half_width:],
        img[half_half_height:-half_half_height, half_half_width:-half_half_width]
    ]

    original_name, extension = os.path.splitext(os.path.basename(image_path))
    extension = ".jpeg"

    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

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


    dirs = [
        ["dataset/test_set/acf_alv/", "dataset/test_set_4x_v2/acf_alv/"],
        ["dataset/test_set/acf_chap/", "dataset/test_set_4x_v2/acf_chap/"],
        ["dataset/test_set/reboco/", "dataset/test_set_4x_v2/reboco/"],
        ["dataset/test_set/tijolo_alv/", "dataset/test_set_4x_v2/tijolo_alv/"],
        ["dataset/test_set/tijolo_chap/", "dataset/test_set_4x_v2/tijolo_chap/"],
        ["dataset/train_set/acf_alv/", "dataset/train_set_4x_v2/acf_alv/"],
        ["dataset/train_set/acf_chap/", "dataset/train_set_4x_v2/acf_chap/"],
        ["dataset/train_set/reboco/", "dataset/train_set_4x_v2/reboco/"],
        ["dataset/train_set/tijolo_alv/", "dataset/train_set_4x_v2/tijolo_alv/"],
        ["dataset/train_set/tijolo_chap/", "dataset/train_set_4x_v2/tijolo_chap/"],        
    ]

    for dir in dirs:
        images_directory = dir[0]
        output_directory = dir[1]
        process_images_in_directory(images_directory, output_directory)
