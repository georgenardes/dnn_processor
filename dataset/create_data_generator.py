import tensorflow as tf
import dataset.dataset_utils as dgu
from glob import glob
import random


CLASS_MAP = {
    "acf_alv": 0,
    "acf_chap": 1,
    "reboco": 2,
    "tijolo_alv": 3,
    "tijolo_chap": 4,
}


def list_images(path, shuffle):
    images_path = glob(path)

    if shuffle:
        random.shuffle(images_path)

    return images_path


def filename_to_label(file_names, class_map_, class_index=-2):
    labels = []
    for file_name in file_names:
        labels.append(class_map_[file_name.split("/")[class_index]])
    return labels


def create_datasets(train_images_rgx, val_images_rgx, batch_size):
    train_images_path = list_images(train_images_rgx, shuffle=True)
    val_images_path = list_images(val_images_rgx, shuffle=True)    

    train_labels = filename_to_label(train_images_path, CLASS_MAP)
    val_labels = filename_to_label(val_images_path, CLASS_MAP)

    train_dataset = dgu.classifier_data_generator(
        train_images_path,
        train_labels,
        oh_depth=tf.constant([5] * len(train_labels)),
        batch_size=batch_size,
    )

    val_dataset = dgu.classifier_data_generator(
        val_images_path,
        val_labels,
        oh_depth=tf.constant([5] * len(val_labels)),
        batch_size=batch_size,
        drop_remainder=False,
    )

    print("Train Dataset:", train_dataset)
    print("Val Dataset:", val_dataset)

    return train_dataset, val_dataset
