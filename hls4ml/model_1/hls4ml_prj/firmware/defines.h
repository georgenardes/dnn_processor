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
#define OUT_HEIGHT_2 64
#define OUT_WIDTH_2 64
#define N_FILT_2 4
#define OUT_HEIGHT_5 61
#define OUT_WIDTH_5 61
#define N_FILT_5 20
#define OUT_HEIGHT_5 61
#define OUT_WIDTH_5 61
#define N_FILT_5 20
#define OUT_HEIGHT_8 59
#define OUT_WIDTH_8 59
#define N_CHAN_8 20
#define OUT_HEIGHT_8 59
#define OUT_WIDTH_8 59
#define N_CHAN_8 20
#define OUT_HEIGHT_11 11
#define OUT_WIDTH_11 11
#define N_CHAN_11 20
#define N_SIZE_0_14 2420
#define N_LAYER_15 5
#define N_LAYER_15 5

// hls-fpga-machine-learning insert layer-precision
typedef ap_fixed<16,6> input_t;
typedef ap_fixed<16,6> model_default_t;
typedef ap_fixed<16,6> layer2_t;
typedef ap_fixed<16,6> layer5_t;
typedef ap_fixed<16,6> layer7_t;
typedef ap_fixed<18,8> activation_955_table_t;
typedef ap_fixed<16,6> layer8_t;
typedef ap_fixed<16,6> layer10_t;
typedef ap_fixed<18,8> activation_956_table_t;
typedef ap_fixed<16,6> layer11_t;
typedef ap_fixed<16,6> layer15_t;
typedef ap_uint<1> layer15_index;
typedef ap_fixed<16,6> result_t;
typedef ap_fixed<18,8> dense_295_softmax_table_t;
typedef ap_fixed<18,8,AP_RND,AP_SAT> dense_295_softmax_exp_table_t;
typedef ap_fixed<18,8,AP_RND,AP_SAT> dense_295_softmax_inv_table_t;

#endif
