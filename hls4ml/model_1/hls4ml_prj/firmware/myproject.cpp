#include <iostream>

#include "myproject.h"
#include "parameters.h"

void myproject(
    input_t input_4[N_INPUT_1_1*N_INPUT_2_1*N_INPUT_3_1],
    result_t layer16_out[N_LAYER_15]
) {

    // hls-fpga-machine-learning insert IO
    #pragma HLS ARRAY_RESHAPE variable=input_4 complete dim=0
    #pragma HLS ARRAY_PARTITION variable=layer16_out complete dim=0
    #pragma HLS INTERFACE ap_vld port=input_4,layer16_out 
    #pragma HLS DATAFLOW 

#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        // hls-fpga-machine-learning insert load weights
        nnet::load_weights_from_txt<model_default_t, 192>(w2, "w2.txt");
        nnet::load_weights_from_txt<model_default_t, 4>(b2, "b2.txt");
        nnet::load_weights_from_txt<model_default_t, 1280>(w5, "w5.txt");
        nnet::load_weights_from_txt<model_default_t, 20>(b5, "b5.txt");
        nnet::load_weights_from_txt<model_default_t, 180>(w8, "w8.txt");
        nnet::load_weights_from_txt<model_default_t, 20>(b8, "b8.txt");
        nnet::load_weights_from_txt<model_default_t, 5120>(w11, "w11.txt");
        nnet::load_weights_from_txt<model_default_t, 20>(b11, "b11.txt");
        nnet::load_weights_from_txt<model_default_t, 12100>(w15, "w15.txt");
        nnet::load_weights_from_txt<model_default_t, 5>(b15, "b15.txt");
        loaded_weights = true;
    }
#endif

    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    // hls-fpga-machine-learning insert layers

    layer2_t layer2_out[OUT_HEIGHT_2*OUT_WIDTH_2*N_FILT_2];
    #pragma HLS ARRAY_PARTITION variable=layer2_out complete dim=0
    nnet::conv_2d_cl<input_t, layer2_t, config2>(input_4, layer2_out, w2, b2); // conv2d_751

    layer5_t layer5_out[OUT_HEIGHT_5*OUT_WIDTH_5*N_FILT_5];
    #pragma HLS ARRAY_PARTITION variable=layer5_out complete dim=0
    nnet::conv_2d_cl<layer2_t, layer5_t, config5>(layer2_out, layer5_out, w5, b5); // conv2d_752

    layer7_t layer7_out[OUT_HEIGHT_5*OUT_WIDTH_5*N_FILT_5];
    #pragma HLS ARRAY_PARTITION variable=layer7_out complete dim=0
    nnet::relu<layer5_t, layer7_t, relu_config7>(layer5_out, layer7_out); // activation_955

    layer8_t layer8_out[OUT_HEIGHT_8*OUT_WIDTH_8*N_CHAN_8];
    #pragma HLS ARRAY_PARTITION variable=layer8_out complete dim=0
    nnet::depthwise_conv_2d_cl<layer7_t, layer8_t, config8>(layer7_out, layer8_out, w8, b8); // depthwise_conv2d_203

    layer10_t layer10_out[OUT_HEIGHT_8*OUT_WIDTH_8*N_CHAN_8];
    #pragma HLS ARRAY_PARTITION variable=layer10_out complete dim=0
    nnet::relu<layer8_t, layer10_t, relu_config10>(layer8_out, layer10_out); // activation_956

    layer11_t layer11_out[OUT_HEIGHT_11*OUT_WIDTH_11*N_CHAN_11];
    #pragma HLS ARRAY_PARTITION variable=layer11_out complete dim=0
    nnet::depthwise_conv_2d_cl<layer10_t, layer11_t, config11>(layer10_out, layer11_out, w11, b11); // depthwise_conv2d_204

    auto& layer14_out = layer11_out;
    layer15_t layer15_out[N_LAYER_15];
    #pragma HLS ARRAY_PARTITION variable=layer15_out complete dim=0
    nnet::dense<layer11_t, layer15_t, config15>(layer14_out, layer15_out, w15, b15); // dense_295

    nnet::softmax<layer15_t, result_t, softmax_config16>(layer15_out, layer16_out); // dense_295_softmax

}
