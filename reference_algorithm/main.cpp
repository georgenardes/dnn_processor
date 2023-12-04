#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <iostream>

#define INPUT_SIZE 3
#define OUTPUT_SIZE 2

using namespace std;

/* Função auxiliar apenas para exibição dos vetores */
void print_vector(int *arr, size_t size)
{
  for (size_t i = 0; i < size; ++i)
  {
    std::cout << arr[i] << " ";
  }
  std::cout << std::endl;
}

/* Função auxiliar apenas para exibição dos vetores */
void print_weights(int matrix[][INPUT_SIZE])
{
  for (size_t i = 0; i < OUTPUT_SIZE; ++i)
  {
    for (size_t j = 0; j < INPUT_SIZE; ++j)
    {
      std::cout << matrix[i][j] << " ";
    }
    std::cout << std::endl;
  }
}

// Função para realizar a retropropagação do erro, calcular o gradiente dos pesos e o erro da camada anterior
void backward(int weights[][INPUT_SIZE], int bias[OUTPUT_SIZE], int input[INPUT_SIZE], int gradient[OUTPUT_SIZE], int error_prev[INPUT_SIZE], int learning_rate)
{
  int weights_gradient;
  int bias_gradient;

  // Calcula o erro da camada anterior
  for (int j = 0; j < INPUT_SIZE; j++)
  {
    error_prev[j] = 0;
    for (int i = 0; i < OUTPUT_SIZE; i++)
    {
      error_prev[j] += gradient[i] * weights[i][j];
    }
  }

  // Calcula o gradiente em relação aos pesos
  for (int i = 0; i < OUTPUT_SIZE; i++)
  {
    for (int j = 0; j < INPUT_SIZE; j++)
    {
      weights_gradient = (gradient[i] * input[j]);

      // update weight
      weights[i][j] -= weights_gradient >> learning_rate;
    }
    bias_gradient = gradient[i];

    // update bias
    bias[i] -= bias_gradient >> learning_rate;
  }
}

int main()
{
  // definição de pesos e vieses
  int weights[OUTPUT_SIZE][INPUT_SIZE] = {{1, 2, 3}, {3, 2, 1}};
  int bias[OUTPUT_SIZE] = {7, 8};

  // entrada da camada
  int input[INPUT_SIZE] = {25, 15, 10};

  // saida produzida pela camada (calculado previamente)
  int output[OUTPUT_SIZE] = {92, 123};

  // Exemplo de gradiente calculado externamenteS
  int output_gradient[OUTPUT_SIZE] = {-5, 5};

  // gradiente da entrada da camada (a ser calculado)
  int err_prev[INPUT_SIZE];

  // taxa de aprendizado (como fator de deslocamento a direita)
  int learning_rate = 6;

  // Retropropagação do erro e atualização dos pesos
  backward(weights, bias, input, output_gradient, err_prev, learning_rate);

  /**
   * Saídas esperadas
     3 4 4
     2 1 1
  */
  print_weights(weights);

  /**
   * Saídas esperadas
     8 8
  */
  print_vector(bias, OUTPUT_SIZE);

  /**
   * Saídas esperadas
     10 0 -10
  */
  print_vector(err_prev, INPUT_SIZE);

  return 0;
}