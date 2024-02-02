#ifndef DEFINES_H_
#define DEFINES_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "nnet_utils/nnet_types.h"
#include <cstddef>
#include <cstdio>

// hls-fpga-machine-learning insert numbers
#define N_INPUT_1_1 256
#define N_INPUT_2_1 256
#define N_INPUT_3_1 3
#define OUT_HEIGHT_2 85
#define OUT_WIDTH_2 85
#define N_CHAN_2 3
#define OUT_HEIGHT_2 85
#define OUT_WIDTH_2 85
#define N_CHAN_2 3
#define OUT_HEIGHT_5 41
#define OUT_WIDTH_5 41
#define N_FILT_5 24
#define OUT_HEIGHT_5 41
#define OUT_WIDTH_5 41
#define N_FILT_5 24
#define OUT_HEIGHT_8 10
#define OUT_WIDTH_8 10
#define N_CHAN_8 24
#define OUT_HEIGHT_8 10
#define OUT_WIDTH_8 10
#define N_CHAN_8 24
#define OUT_HEIGHT_16 10
#define OUT_WIDTH_16 10
#define N_FILT_16 40
#define N_SIZE_0_13 4000
#define N_LAYER_14 5

// hls-fpga-machine-learning insert layer-precision
typedef nnet::array<ap_fixed<16,6>, 3*1> input_t;
typedef ap_fixed<16,6> model_default_t;
typedef nnet::array<ap_fixed<16,6>, 3*1> layer2_t;
typedef ap_fixed<16,6> depthwise_conv2d_220_weight_t;
typedef ap_fixed<16,6> depthwise_conv2d_220_bias_t;
typedef nnet::array<ap_fixed<16,6>, 3*1> layer4_t;
typedef ap_fixed<18,8> activation_759_table_t;
typedef nnet::array<ap_fixed<16,6>, 24*1> layer5_t;
typedef ap_fixed<16,6> conv2d_810_weight_t;
typedef ap_fixed<16,6> conv2d_810_bias_t;
typedef nnet::array<ap_fixed<16,6>, 24*1> layer7_t;
typedef ap_fixed<18,8> activation_760_table_t;
typedef nnet::array<ap_fixed<16,6>, 24*1> layer8_t;
typedef ap_fixed<16,6> depthwise_conv2d_221_weight_t;
typedef ap_fixed<16,6> depthwise_conv2d_221_bias_t;
typedef nnet::array<ap_fixed<16,6>, 24*1> layer10_t;
typedef ap_fixed<18,8> activation_761_table_t;
typedef nnet::array<ap_fixed<16,6>, 40*1> layer16_t;
typedef ap_fixed<16,6> conv2d_811_weight_t;
typedef ap_fixed<16,6> conv2d_811_bias_t;
typedef nnet::array<ap_fixed<16,6>, 5*1> result_t;
typedef ap_fixed<16,6> dense_271_weight_t;
typedef ap_fixed<16,6> dense_271_bias_t;
typedef ap_uint<1> layer14_index;

#endif
