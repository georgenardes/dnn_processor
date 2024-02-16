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


def create_datasets(train_images_rgx, val_images_rgx, batch_size, image_size):
    train_images_path = list_images(train_images_rgx, shuffle=True)
    val_images_path = list_images(val_images_rgx, shuffle=False)

    assert len(train_images_path) > 0, "0 images found."
    assert len(val_images_path) > 0, "0 images found."

    train_labels = filename_to_label(train_images_path, CLASS_MAP)
    val_labels = filename_to_label(val_images_path, CLASS_MAP)

    train_dataset = dgu.classifier_data_generator(
        train_images_path,
        train_labels,
        oh_depth=5,  # tf.constant([5] * len(train_labels)), use this when tf==2.10
        batch_size=batch_size,
        image_size=image_size,
    )

    val_batch_size = len(val_images_path)
    val_batch_size = val_batch_size if val_batch_size < batch_size else batch_size

    val_dataset = dgu.classifier_data_generator(
        val_images_path,
        val_labels,
        oh_depth=5,  # tf.constant([5] * len(val_labels)),
        batch_size=batch_size,
        image_size=image_size,
        drop_remainder=False,
    )

    return train_dataset, val_dataset, len(CLASS_MAP.values())


def create_train_val_datasets(images_rgx, batch_size, image_size, ratio=0.1):
    images_path = list_images(images_rgx, shuffle=True)
    train_images_path = images_path[0 : int(len(images_path) * ratio)]
    val_images_path = images_path[int(len(images_path) * ratio) :]

    assert len(train_images_path) > 0, "0 images found."
    assert len(val_images_path) > 0, "0 images found."

    train_labels = filename_to_label(train_images_path, CLASS_MAP)
    val_labels = filename_to_label(val_images_path, CLASS_MAP)

    train_dataset = dgu.classifier_data_generator(
        train_images_path,
        train_labels,
        oh_depth=5,  # tf.constant([5] * len(train_labels)), use this when tf==2.10
        batch_size=batch_size,
        image_size=image_size,
    )

    val_batch_size = len(val_images_path)
    val_batch_size = val_batch_size if val_batch_size < batch_size else batch_size

    val_dataset = dgu.classifier_data_generator(
        val_images_path,
        val_labels,
        oh_depth=5,  # tf.constant([5] * len(val_labels)),
        batch_size=batch_size,
        image_size=image_size,
        drop_remainder=False,
    )

    return train_dataset, val_dataset, len(CLASS_MAP.values())
