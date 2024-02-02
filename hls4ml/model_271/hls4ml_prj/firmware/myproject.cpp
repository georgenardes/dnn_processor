#include <iostream>

#include "myproject.h"
#include "parameters.h"

void myproject(
    hls::stream<input_t> &input_1,
    hls::stream<result_t> &layer14_out
) {

    // hls-fpga-machine-learning insert IO
    #pragma HLS INTERFACE axis port=input_1,layer14_out 
    #pragma HLS DATAFLOW 

#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        // hls-fpga-machine-learning insert load weights
        nnet::load_weights_from_txt<depthwise_conv2d_220_weight_t, 27>(w2, "w2.txt");
        nnet::load_weights_from_txt<depthwise_conv2d_220_bias_t, 3>(b2, "b2.txt");
        nnet::load_weights_from_txt<conv2d_810_weight_t, 1800>(w5, "w5.txt");
        nnet::load_weights_from_txt<conv2d_810_bias_t, 24>(b5, "b5.txt");
        nnet::load_weights_from_txt<depthwise_conv2d_221_weight_t, 384>(w8, "w8.txt");
        nnet::load_weights_from_txt<depthwise_conv2d_221_bias_t, 24>(b8, "b8.txt");
        nnet::load_weights_from_txt<conv2d_811_weight_t, 960>(w16, "w16.txt");
        nnet::load_weights_from_txt<conv2d_811_bias_t, 40>(b16, "b16.txt");
        nnet::load_weights_from_txt<dense_271_weight_t, 20000>(w14, "w14.txt");
        nnet::load_weights_from_txt<dense_271_bias_t, 5>(b14, "b14.txt");
        loaded_weights = true;
    }
#endif

    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    // hls-fpga-machine-learning insert layers

    hls::stream<layer2_t> layer2_out("layer2_out");
    #pragma HLS STREAM variable=layer2_out depth=7225
    nnet::depthwise_conv_2d_cl<input_t, layer2_t, config2>(input_1, layer2_out, w2, b2); // depthwise_conv2d_220

    hls::stream<layer4_t> layer4_out("layer4_out");
    #pragma HLS STREAM variable=layer4_out depth=7225
    nnet::tanh<layer2_t, layer4_t, tanh_config4>(layer2_out, layer4_out); // activation_759

    hls::stream<layer5_t> layer5_out("layer5_out");
    #pragma HLS STREAM variable=layer5_out depth=1681
    nnet::conv_2d_cl<layer4_t, layer5_t, config5>(layer4_out, layer5_out, w5, b5); // conv2d_810

    hls::stream<layer7_t> layer7_out("layer7_out");
    #pragma HLS STREAM variable=layer7_out depth=1681
    nnet::tanh<layer5_t, layer7_t, tanh_config7>(layer5_out, layer7_out); // activation_760

    hls::stream<layer8_t> layer8_out("layer8_out");
    #pragma HLS STREAM variable=layer8_out depth=100
    nnet::depthwise_conv_2d_cl<layer7_t, layer8_t, config8>(layer7_out, layer8_out, w8, b8); // depthwise_conv2d_221

    hls::stream<layer10_t> layer10_out("layer10_out");
    #pragma HLS STREAM variable=layer10_out depth=100
    nnet::relu<layer8_t, layer10_t, relu_config10>(layer8_out, layer10_out); // activation_761

    hls::stream<layer16_t> layer16_out("layer16_out");
    #pragma HLS STREAM variable=layer16_out depth=100
    nnet::pointwise_conv_2d_cl<layer10_t, layer16_t, config16>(layer10_out, layer16_out, w16, b16); // conv2d_811

    auto& layer13_out = layer16_out;
    nnet::dense<layer16_t, result_t, config14>(layer13_out, layer14_out, w14, b14); // dense_271

}
