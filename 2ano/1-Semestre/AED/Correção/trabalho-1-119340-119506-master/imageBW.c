/// imageBW - A simple image processing module for BW images
///           represented using run-length encoding (RLE)
///
/// This module is part of a programming project
/// for the course AED, DETI / UA.PT
///
/// You may freely use and modify this code, at your own risk,
/// as long as you give proper credit to the original and subsequent authors.
///
/// The AED Team <jmadeira@ua.pt, jmr@ua.pt, ...>
/// 2024

// Student authors (fill in below):
// NMec: 119340
// Name: Afonso Salazar
// NMec: 119506
// Name: Vitor Zadorozhnyy
//
// Date: 25/11/24
//

#include "imageBW.h"

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "instrumentation.h"

// The data structure
//
// A BW image is stored in a structure containing 3 fields:
// Two integers store the image width and height.
// The other field is a pointer to an array that stores the pointers
// to the RLE compressed image rows.
//
// Clients should use images only through variables of type Image,
// which are pointers to the image structure, and should not access the
// structure fields directly.

// Constant value --- Use them throughout your code
// const uint8 BLACK = 1;  // Black pixel value, defined on .h
// const uint8 WHITE = 0;  // White pixel value, defined on .h
const int EOR = -1;  // Stored as the last element of a RLE row

// Internal structure for storing RLE BW images
struct image {
  uint32 width;
  uint32 height;
  int** row;  // pointer to an array of pointers referencing the compressed rows
};

// This module follows "design-by-contract" principles.
// Read `Design-by-Contract.md` for more details.

/// Error handling functions

// In this module, only functions dealing with memory allocation or
// file (I/O) operations use defensive techniques.
// When one of these functions fails,
// it immediately prints an error and exits the program.
// This fail-fast approach to error handling is simpler for the programmer.

// Use the following function to check a condition
// and exit if it fails.

// Check a condition and if false, print failmsg and exit.
static void check(int condition, const char* failmsg) {
  if (!condition) {
    perror(failmsg);
    exit(errno || 255);
  }
}

/// Init Image library.  (Call once!)
/// Currently, simply calibrate instrumentation and set names of counters.
void ImageInit(void) {  ///
  InstrCalibrate();
  InstrName[0] = "pixmem";  // InstrCount[0] will count pixel array acesses
  // Name other counters here...
}

// Macros to simplify accessing instrumentation counters:
#define PIXMEM InstrCount[0]
// Add more macros here...

// TIP: Search for PIXMEM or InstrCount to see where it is incremented!

/// Auxiliary (static) functions

/// Create the header of an image data structure
/// And allocate the array of pointers to RLE rows
static Image AllocateImageHeader(uint32 width, uint32 height) {
  assert(width > 0 && height > 0);
  Image newHeader = malloc(sizeof(struct image));
  check(newHeader != NULL, "malloc");

  newHeader->width = width;
  newHeader->height = height;

  // Allocating the array of pointers to RLE rows
  newHeader->row = malloc(height * sizeof(int*));
  check(newHeader->row != NULL, "malloc");

  return newHeader;
}

/// Allocate an array to store a RLE row with n elements
static int* AllocateRLERowArray(uint32 n) {
  assert(n > 2);
  int* newArray = malloc(n * sizeof(int));
  check(newArray != NULL, "malloc");

  return newArray;
}

/// Compute the number of runs of a non-compressed (RAW) image row
static uint32 GetNumRunsInRAWRow(uint32 image_width, const uint8* RAW_row) {
  assert(image_width > 0);
  assert(RAW_row != NULL);

  // How many runs?
  uint32 num_runs = 1;
  for (uint32 i = 1; i < image_width; i++) {
    if (RAW_row[i] != RAW_row[i - 1]) {
      num_runs++;
    }
  }

  return num_runs;
}

/// Get the number of runs of a compressed RLE image row
static uint32 GetNumRunsInRLERow(const int* RLE_row) {
  assert(RLE_row != NULL);

  // Go through the RLE_row until EOR is found
  // Discard RLE_row[0], since it is a pixel color

  uint32 num_runs = 0;
  uint32 i = 1;
  while (RLE_row[i] != EOR) {
    num_runs++;
    i++;
  }

  return num_runs;
}

/// Get the number of elements of an array storing a compressed RLE image row
static uint32 GetSizeRLERowArray(const int* RLE_row) {
  assert(RLE_row != NULL);

  // Go through the array until EOR is found
  uint32 i = 0;
  while (RLE_row[i] != EOR) {
    i++;
  }

  return (i + 1);
}

/// Compress into RLE format a RAW image row
/// Allocates and returns the array storing the image row in RLE format
static int* CompressRow(uint32 image_width, const uint8* RAW_row) {
  assert(image_width > 0);
  assert(RAW_row != NULL);

  // How many runs?
  uint32 num_runs = GetNumRunsInRAWRow(image_width, RAW_row);

  // Allocate the RLE row array
  int* RLE_row = malloc((num_runs + 2) * sizeof(int));
  check(RLE_row != NULL, "malloc");

  // Go through the RAW_row
  RLE_row[0] = (int)RAW_row[0];  // Initial pixel value
  uint32 index = 1;
  int num_pixels = 1;
  for (uint32 i = 1; i < image_width; i++) {
    if (RAW_row[i] != RAW_row[i - 1]) {
      RLE_row[index++] = num_pixels;
      num_pixels = 0;
    }
    num_pixels++;
  }
  RLE_row[index++] = num_pixels;
  RLE_row[index] = EOR;  // Reached the end of the row

  return RLE_row;
}

static uint8* UncompressRow(uint32 image_width, const int* RLE_row) {
  assert(image_width > 0);
  assert(RLE_row != NULL);

  // The uncompressed row
  uint8* row = (uint8*)malloc(image_width * sizeof(uint8));
  check(row != NULL, "malloc");

  // Go through the RLE_row until EOR is found
  int pixel_value = RLE_row[0];
  uint32 i = 1;
  uint32 dest_i = 0;
  while (RLE_row[i] != EOR) {
    // For each run
    for (int aux = 0; aux < RLE_row[i]; aux++) {
      row[dest_i++] = (uint8)pixel_value;
    }
    // Next run
    i++;
    pixel_value ^= 1;
  }

  return row;
}

// Add your auxiliary functions here...

/// Image management functions

/// Create a new BW image, either BLACK or WHITE.
///   width, height : the dimensions of the new image.
///   val: the pixel color (BLACK or WHITE).
/// Requires: width and height must be non-negative, val is either BLACK or
/// WHITE.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageCreate(uint32 width, uint32 height, uint8 val) {
  assert(width > 0 && height > 0);
  assert(val == WHITE || val == BLACK);

  Image newImage = AllocateImageHeader(width, height);

  // All image pixels have the same value
  int pixel_value = (int)val;

  // Creating the image rows, each row has just 1 run of pixels
  // Each row is represented by an array of 3 elements [value,length,EOR]
  for (uint32 i = 0; i < height; i++) {
    newImage->row[i] = AllocateRLERowArray(3);
    newImage->row[i][0] = pixel_value;
    newImage->row[i][1] = (int)width;
    newImage->row[i][2] = EOR;
  }

  return newImage;
}

/// Create a new BW image, with a perfect CHESSBOARD pattern.
///   width, height : the dimensions of the new image.
///   square_edge : the lenght of the edges of the sqares making up the
///   chessboard pattern.
///   first_value: the pixel color (BLACK or WHITE) of the
///   first image pixel.
/// Requires: width and height must be non-negative, val is either BLACK or
/// WHITE.
/// Requires: for the squares, width and height must be multiples of the
/// edge lenght of the squares
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)




Image ImageCreateChessboard(uint32 width, uint32 height, uint32 square_edge, uint8 first_value) {
    assert(width > 0 && height > 0); //Esta linha certifica que os valores para as dimensões da imagem são positivos.
    assert(square_edge > 0); //Esta linha certifica que os lados dos quadrados são positivos
    assert(first_value == BLACK || first_value == WHITE); //Nesta linha certificamo-nos que o valor inicial ou é preto ou branco
    assert(width % square_edge == 0 && height % square_edge == 0); //Aqui certificamos que a altura e a largura da imagem é divisivel pelos lados do quadrado, isto para nos certificarmos que a imagem é bem formada

    uint32 total_runs = 0; //Cria o contador de runs
    uint64_t total_memory = 0;
    Image newImage = AllocateImageHeader(width, height);

    for (uint32 row = 0; row < height; row++) { //Neste loop contrói-se o tabuleiro linha por linha alternando-se as cores
        int* compressed_row = AllocateRLERowArray((width / square_edge) * 2 + 2); //Nesta linha armazenamos os dados compactados em formato RLE, no array compressed_row
        

        int pixel_value = (row / square_edge) % 2 == 0 ? first_value : first_value ^ 1; //Esta linha alterna a cor inicial de cada linha com base na posição vertical do quadrado

        compressed_row[0] = pixel_value; //Aqui definimos o valor do primeiro pixel da linha
        uint32 index = 1; //Aqui inicializa-se a contagem index para começar a preencher o array a partir de 1

        for (uint32 col = 0; col < width; col += square_edge) { //Aqui iteramos sobr as colunas da linha, quadrado a quadrado
            compressed_row[index++] = square_edge; //Aqui armazenamos o tamanho do quadrado atual
            pixel_value ^= 1; //Por fim altera a cor para o quadrado seguinte
            total_runs++; //Aumenta para cada run
        }

        compressed_row[index] = EOR; //Aqui indicamos que o restante da linha foi processada
        newImage->row[row] = compressed_row; //A linha comprimida aqui é associada á linha na estrutura da imagem

        uint32 num_runs = GetNumRunsInRLERow(compressed_row);
        uint64_t memory_for_row = (num_runs + 2) * sizeof(int); 
        total_memory += memory_for_row; 

        printf("Row %u: Computed Runs = %u, Expected Runs = %u\n", row, num_runs, width / square_edge);
        assert(num_runs == width / square_edge);
    }

    printf("Total Runs(Pratico): %u\n", total_runs); //Imprime o número total de runs
    printf("Total Runs(Teorico): %u\n", ((width/square_edge)*height) );
    printf("Memoria usada: %lu bytes\n", total_memory);

    return newImage; //Por fim a função retorna a imagem
}



/// Destroy the image pointed to by (*imgp).
///   imgp : address of an Image variable.
/// If (*imgp)==NULL, no operation is performed.
/// Ensures: (*imgp)==NULL.
/// Should never fail.
void ImageDestroy(Image* imgp) {
  assert(imgp != NULL);

  Image img = *imgp;

  for (uint32 i = 0; i < img->height; i++) {
    free(img->row[i]);
  }
  free(img->row);
  free(img);

  *imgp = NULL;
}

/// Printing on the console

/// Output the raw BW image
void ImageRAWPrint(const Image img) {
  assert(img != NULL);

  printf("width = %d height = %d\n", img->width, img->height);
  printf("RAW image:\n");

  // Print the pixels of each image row
  for (uint32 i = 0; i < img->height; i++) {
    // The value of the first pixel in the current row
    int pixel_value = img->row[i][0];
    for (uint32 j = 1; img->row[i][j] != EOR; j++) {
      // Print the current run of pixels
      for (int k = 0; k < img->row[i][j]; k++) {
        printf("%d", pixel_value);
      }
      // Switch (XOR) to the pixel value for the next run, if any
      pixel_value ^= 1;
    }
    // At current row end
    printf("\n");
  }
  printf("\n");
}

/// Output the compressed RLE image
void ImageRLEPrint(const Image img) {
  assert(img != NULL);

  printf("width = %d height = %d\n", img->width, img->height);
  printf("RLE encoding:\n");

  // Print the compressed rows information
  for (uint32 i = 0; i < img->height; i++) {
    uint32 j;
    for (j = 0; img->row[i][j] != EOR; j++) {
      printf("%d ", img->row[i][j]);
    }
    printf("%d\n", img->row[i][j]);
  }
  printf("\n");
}

/// PBM BW file operations

// See PBM format specification: http://netpbm.sourceforge.net/doc/pbm.html

// Auxiliary function
static void unpackBits(int nbytes, const uint8 bytes[], uint8 raw_row[]) {
  // bitmask starts at top bit
  int offset = 0;
  uint8 mask = 1 << (7 - offset);
  while (offset < 8) {  // or (mask > 0)
    for (int b = 0; b < nbytes; b++) {
      raw_row[8 * b + offset] = (bytes[b] & mask) != 0;
    }
    mask >>= 1;
    offset++;
  }
}

// Auxiliary function
static void packBits(int nbytes, uint8 bytes[], const uint8 raw_row[]) {
  // bitmask starts at top bit
  int offset = 0;
  uint8 mask = 1 << (7 - offset);
  while (offset < 8) {  // or (mask > 0)
    for (int b = 0; b < nbytes; b++) {
      if (offset == 0) bytes[b] = 0;
      bytes[b] |= raw_row[8 * b + offset] ? mask : 0;
    }
    mask >>= 1;
    offset++;
  }
}

// Match and skip 0 or more comment lines in file f.
// Comments start with a # and continue until the end-of-line, inclusive.
// Returns the number of comments skipped.
static int skipComments(FILE* f) {
  char c;
  int i = 0;
  while (fscanf(f, "#%*[^\n]%c", &c) == 1 && c == '\n') {
    i++;
  }
  return i;
}

/// Load a raw PBM file.
/// Only binary PBM files are accepted.
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageLoad(const char* filename) {  ///
  int w, h;
  char c;
  FILE* f = NULL;
  Image img = NULL;

  check((f = fopen(filename, "rb")) != NULL, "Open failed");
  // Parse PBM header
  check(fscanf(f, "P%c ", &c) == 1 && c == '4', "Invalid file format");
  skipComments(f);
  check(fscanf(f, "%d ", &w) == 1 && w >= 0, "Invalid width");
  skipComments(f);
  check(fscanf(f, "%d", &h) == 1 && h >= 0, "Invalid height");
  check(fscanf(f, "%c", &c) == 1 && isspace(c), "Whitespace expected");

  // Allocate image
  img = AllocateImageHeader(w, h);

  // Read pixels
  int nbytes = (w + 8 - 1) / 8;  // number of bytes for each row
  // using VLAs...
  uint8 bytes[nbytes];
  uint8 raw_row[nbytes * 8];
  for (uint32 i = 0; i < img->height; i++) {
    check(fread(bytes, sizeof(uint8), nbytes, f) == (size_t)nbytes,
          "Reading pixels");
    unpackBits(nbytes, bytes, raw_row);
    img->row[i] = CompressRow(w, raw_row);
  }

  fclose(f);
  return img;
}

/// Save image to PBM file.
/// On success, returns unspecified integer. (No need to check!)
/// On failure, does not return, EXITS program!
int ImageSave(const Image img, const char* filename) {  ///
  assert(img != NULL);
  int w = img->width;
  int h = img->height;
  FILE* f = NULL;

  check((f = fopen(filename, "wb")) != NULL, "Open failed");
  check(fprintf(f, "P4\n%d %d\n", w, h) > 0, "Writing header failed");

  // Write pixels
  int nbytes = (w + 8 - 1) / 8;  // number of bytes for each row
  // using VLAs...
  uint8 bytes[nbytes];
  // unit8 raw_row[nbytes*8];
  for (uint32 i = 0; i < img->height; i++) {
    // UncompressRow...
    uint8* raw_row = UncompressRow(nbytes * 8, img->row[i]);
    // Fill padding pixels with WHITE
    memset(raw_row + w, WHITE, nbytes * 8 - w);
    packBits(nbytes, bytes, raw_row);
    size_t written = fwrite(bytes, sizeof(uint8), nbytes, f);
    check(written == (size_t)nbytes, "Writing pixels failed");
    free(raw_row);
  }

  // Cleanup
  fclose(f);
  return 0;
}

/// Information queries

/// Get image width
int ImageWidth(const Image img) {
  assert(img != NULL);
  return img->width;
}

/// Get image height
int ImageHeight(const Image img) {
  assert(img != NULL);
  return img->height;
}

/// Image comparison

int ImageIsEqual(const Image img1, const Image img2) {              //recebe dois ponteiros para image como parametros(img1 e img2) e returna um inteiro
  assert(img1 != NULL && img2 != NULL);                             //Verifica se ambos os ponteiras de imagem são válidos
  
  if (img1->width != img2->width || img1->height !=img2->height) {    // Verifica se as dimensoes das duas imagens são iguais
    return 0; //Imagens diferentes
  }

  for (uint32 row = 0; row < img1->height; row++) { //Itera sobre cada linha das imagens, começando da linha 0 até a altura total da imagem 
    int* row1 = img1->row[row];                     //obtem os ponteiros para as linhas atuais de ambas as imagens
    int* row2 = img2->row[row];

    uint32 index = 0;    //inicia o indece de coluna idex para percorrer os elementos das linhas 
    while (row1[index] != EOR && row2[index] != EOR) { //inicia um loop para comparar os elementos das linhas
      if (row1[index] != row2[index]){  //compara os valores dos elementos corresndentes nas duas linhas 
        return 0; //Diferença encontrada
      }
      index++; //avanca para o proxima indice da linha
    }
    if (row1[index] != EOR || row2[index] != EOR) {  // Verifica se ambos os ponteiros das linhas atingiram o marcador EOR.
      return 0; //Diferente numero de runs
    }
  }
  return 1;//Sao iguais 
}

int ImageIsDifferent(const Image img1, const Image img2) {
  assert(img1 != NULL && img2 != NULL);
  return !ImageIsEqual(img1, img2);
}

/// Boolean Operations on image pixels

/// These functions apply boolean operations to images,
/// returning a new image as a result.
///
/// Operand images are left untouched and must be of the same size.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)

Image ImageNEG(const Image img) {
  assert(img != NULL);

  uint32 width = img->width;
  uint32 height = img->height;

  Image newImage = AllocateImageHeader(width, height);

  // Directly copying the rows, one by one
  // And changing the value of row[i][0]

  for (uint32 i = 0; i < height; i++) {
    uint32 num_elems = GetSizeRLERowArray(img->row[i]);
    newImage->row[i] = AllocateRLERowArray(num_elems);
    memcpy(newImage->row[i], img->row[i], num_elems * sizeof(int));
    newImage->row[i][0] ^= 1;  // Just negate the value of the first pixel run
  }

  return newImage;
}

Image ImageAND(const Image img1, const Image img2) {   //recebe duas imagens como entrada e retorna uma nova imagem
  assert(img1 != NULL && img2 != NULL); // para garantie que as imagens de entrada nao sejam nulas 
  assert(img1->width == img2->width && img1->height == img2->height);// Verifica se as dimensoes das duas imagens sao iguais para fazer AND

  uint32 width = img1->width;
  uint32 height = img1->height;   //armazena a largura e a altura das imagens em variaveis locais 

  Image newImage = AllocateImageHeader(width,height);   // aloca uma nova imagem com as mesmas dimensoes da imagens de entrada.

  int cont = 0; //Contador de comparações

  for (uint32 row = 0; row < height; row++){            //Percorre cada linha das imagens
    uint8* row1 = UncompressRow(width, img1->row[row]); //descomprime a linha atual de cada imagemj 
    uint8* row2 = UncompressRow(width, img2->row[row]);  // A descompressao converte os dados de um formato compromido para um array de valoresn brutos
    uint8* result_row = malloc(width * sizeof(uint8));   //Aloca a memoria para armazenar a linha resultante da operacao AND. Cada pixel é representado como um valor uint8
    check(result_row != NULL, "malloc");   //verifica se a alocaçao correu bem com check

    for (uint32 col = 0; col < width; col++){ //Itera sobre cada pixel da linha atual
      result_row[col] = row1[col] & row2[col];//faz uma operçao logica And bit a bit entre os valores correspondestes das duas imagens , armazenando o resultado 
      cont++;
    }

    newImage->row[row] = CompressRow(width, result_row); //omprime a linha resultante usando a funçao compressrow e a armazena na linha correspondemte de nova imagem 
    free(row1);  //liberta a memoria alocada para as linhas descomprimidas e a linha resultante 
    free(row2);
    free(result_row);
  }

  printf("%i\n", cont); //Número total de comparações
  return newImage;
}

/*
Image ImageAND(const Image img1, const Image img2){
  assert(img1 != NULL && img2 !=NULL);
  assert(img1->width == img2->width && img1->height == img2->height);

  uint32 width = img1->width;
  uint32 height = img1->height;

  Image newImage = AllocateImageHeader(width, height);
  int cont = 0;

  for (uint32 row = 0; row < height; row++){
    int* row1 = img1->row[row];
    int* row2 = img2->row[row];
    int* result_row = malloc(width * sizeof(int));
    check(result_row != NULL, "malloc");

    for (uint col = 0; col < width; col++){
      result_row[col] = row1[col] & row2[col];
      cont++;
    }
    newImage->row[row] = result_row;
  }
  printf("%i\n", cont);
  return newImage;
}
*/

Image ImageOR(const Image img1, const Image img2) {
  assert(img1 != NULL && img2 != NULL);

  //Aqui confirmamos que as dimensões das duas imagens são iguais
  assert(ImageWidth(img1) == ImageWidth(img2));
  assert(ImageHeight(img1) == ImageHeight(img2));

  //Aqui obtemos as dimensões das imagens
  uint32 width = ImageWidth(img1);
  uint32 heigth = ImageHeight(img1);

  //Criamos uma nova imagem para armazenar o resultado
  Image result = AllocateImageHeader(width, heigth);

  //Precorre para cada linha das imagens
  for (uint32 row = 0; row < heigth; row++) {
    //Ponteiros para as linhas RLE correspondentes para cada imagem
    const int* row1 = img1->row[row];
    const int* row2 = img2->row[row];

    //Array RLE para armazenar a linha reusltante
    int* result_row = AllocateRLERowArray(width * 2 + 2);

    uint32 index1 = 0, index2 = 0, result_index = 0;
    int value1 = row1[index1++];
    int value2 = row2[index2++];

    //Variáveis temporárias para os comprimentos restantes
    uint32 rem_length1 = row1[index1];
    uint32 rem_length2 = row2[index2];

    //Processamos as linhas até que ambos os comprimentos cheguem a EOR
    while (rem_length1 != (uint32)EOR && rem_length2 != (uint32)EOR) {
      //Calculamos o menor comprimento entre dois blocos
      uint32 min_length = rem_length1 < rem_length2 ? rem_length1 : rem_length2;

      //Aqui usando a operação OR realizamos uma combinação lógica entre os dois valores para variar intensidade
      int or_value = value1 | value2;

      //Se o valor atual for diferente do último, cria-se um novo bloco
      if (result_index == 0 || result_row[result_index - 2] != or_value) {
        result_row[result_index++] = or_value;
        result_row[result_index++] = min_length;
      } else {
        //Caso contrário aumentamos o comprimento do cubo
        result_row[result_index - 1] += min_length;
      }

      //Aumentamos os comprimentos restantes e passamos para o próximo bloco da imagem 1
      if (rem_length1 == min_length) {
        //Avançamos para o próximo valo no formato RLE
        index1++;
        value1 = row1[index1++];
      } else {
        //Ou reduzimos o comprimento restante do bloco atual
        rem_length1 -= min_length;
      }

      //Aumentamos os comprimentos restantes e passamos para o próximo bloco da imagem 2
      if (rem_length2 == min_length) {
        //Avançamos para o próximo valo no formato RLE
        index2++;
        value2 = row2[index2++];
      } else {
        //Ou reduzimos o comprimento restante do bloco atual
        rem_length2 -= min_length;
      }
      
    }
      //Finalizamos a linha resultante com o indicador EOR
      result_row[result_index] = EOR;

      //Atríbuimos a linha resultante ao cabeçalho da imagem de saída
      result->row[row] = result_row;

    
  }
    //Retornamos a imagem resultante
  return result;
  
}



Image ImageXOR(Image img1, Image img2) {
  assert(img1 != NULL && img2 != NULL);

  //Primeiro verificamos que as dimensões das imagens são iguais
  assert(ImageWidth(img1) == ImageWidth(img2));
  assert(ImageHeight(img1) == ImageHeight(img2));
  
  uint32 width = ImageWidth(img1);
  uint32 height = ImageHeight(img2);

  //Aqui criamos a nova imagem, com as dimensões das outras duas, para armazenar o resultado do XOR
  Image result = AllocateImageHeader(width, height);

  //Percorre cada linha das imagens
  for(uint32 row = 0; row < height; row++) {
    //Aqui obtemos os ponteiros para as linhas RLE das duas imagens
    const int* row1 = img1->row[row];
    const int* row2 = img2->row[row];

    //Criamos um array RLE para armazenar a linha resultante
    int* result_row = AllocateRLERowArray(width * 2 + 2);

    //Estes são os índices para percorrer as linhas RLE
    uint32 index1 = 0, index2 = 0, result_index = 0;

    //Obtemos os valores iniciais de pixel para as linhas
    int value1 = row1[index1++];
    int value2 = row2[index2++];

    //Variáveis temporárias para os comprimentos restantes
    uint32 rem_length1 = row1[index1];
    uint32 rem_length2 = row2[index2];

    //Aqui temos o loop principal para calcular o XOR entre os pixels das diferentes imagens
    while (rem_length1 != (uint32)EOR && rem_length2 != (uint32)EOR) {
      //Determinamos o menor comprimento entre os dois segmentos
      uint32 min_length = rem_length1 < rem_length2 ? rem_length1 : rem_length2;

      //Caculo do XOR entre os dois valores de pixel
      int xor_value = value1 ^ value2;

      //Adiciona o resultado à linha resultante, se for o primeiro valor ou se o último valor adicionado for difenrete
      if (result_index == 0 || result_row[result_index -2] != xor_value) {
        //Adiciona o novo valor de pixel e o comprimnto
        result_row[result_index++] = xor_value;
        result_row[result_index++] = min_length;
      } else {
        //Caso contrário aumenta o comprimento do segmento atual
        result_row[result_index - 1] += min_length;
      }

      //Atualização dos comprimentos restantes e dos valores
      if (rem_length1 == min_length) {
        //Move-se para o próximo segmento da linha
        index1++;
        value1 = row1[index1++];
        rem_length1 = row1[index1];
      } else {
        //Reduz o comprimento restante do segmento atual
        rem_length1 -= min_length;
      }

      if (rem_length2 == min_length) {
        //Move-se para o próximo segmento da linha
        index2++;
        value2 = row2[index2++];
        rem_length2 = row2[index2];
      } else {
        //Reduz o comprimento restante do segmento atual
        rem_length2 -= min_length;
      }
    }

    //Aqui finalizamos a linha resultante
    result_row[result_index] = EOR;
    result->row[row] = result_row;

  }

  return result;
}

//OR retorna 1 se pelo menos um bit for 1, XOR retorna 1 apenas se os bits forem diferentes.


/// Geometric transformations

/// These functions apply geometric transformations to an image,
/// returning a new image as a result.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)

/// Mirror an image = flip top-bottom.
/// Returns a mirrored version of the image.
/// Ensures: The original img is not modified.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageHorizontalMirror(const Image img) {
  assert(img != NULL); // garante que a imagem nao e nula

  uint32 width = img->width; //Armazena a largura e altura da imagem nas variaveis 
  uint32 height = img->height;

  Image newImage = AllocateImageHeader(width, height); //Aloca um novo cabeçalho para a imagem espelhada com as mesmas dimensoes da imagem original

  for (uint32 row = 0; row < height; row++) {  //percorre cada linha da imagem original
    uint32 mirrored_row = height - row - 1; //calcula o indice da linha correspondente na posiçao espelhada horizontalmente 
    uint32 num_elems = GetSizeRLERowArray(img->row[mirrored_row]); //Obtem o numero de elemnetos da linha espelhada. 
    newImage->row[row] = AllocateRLERowArray(num_elems); //Aloca espaco para a nive linha corespondente na imagem espelhada 
    memcpy(newImage->row[row], img->row[mirrored_row], num_elems * sizeof(int)); // Copia os dados da linha espelhada da imagem original para a nova linha na imagem espelhada 
  }
  return newImage;
}

/// Mirror an image = flip left-right.
/// Returns a mirrored version of the image.
/// Ensures: The original img is not modified.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageVerticalMirror(const Image img) {
  assert(img != NULL); //verifica se a imagem nao é nula

  uint32 width = img->width; //armazena a largura e altura da imagem em variaveis locais 
  uint32 height = img->height;

  Image newImage = AllocateImageHeader(width, height); //cria uma nova imagem vazia com as mesmas dimensoes da imagem de entrada usando allocateImageHeader 

  //Neste for esplhamos a imagem invertendo o conteúdo de cada linha
  for (uint32 row = 0; row < height; row++) {
    uint32 row_size = GetSizeRLERowArray(img->row[row]);
    newImage->row[row] = AllocateRLERowArray(row_size); 

    //Percore a linha original e inverte os seus valores
    int* src_row = img->row[row];
    int* dest_row = newImage-> row[row];  

    //Inverte o valor inicial do pixel
    dest_row[0] = src_row[0] ^ 1;
    
    //Aqui copiamos os comprimentos de cada "run" na ordem inversa
    int run_index = 1;
    uint32 write_index = row_size - 2; //Posição final no destino
    while (src_row[run_index] != EOR) {
      dest_row[write_index--] = src_row[run_index++];
    }

    //Aqui marcamos o fim de linha(EOR)
    dest_row[row_size - 1] = EOR;
  }

  return newImage;
}

/// Replicate img2 at the bottom of imag1, creating a larger image
/// Requires: the width of the two images must be the same.
/// Returns the new larger image.
/// Ensures: The original images are not modified.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageReplicateAtBottom(const Image img1, const Image img2) {
  assert(img1 != NULL && img2 != NULL);  
  assert(img1->width == img2->width);  //Garante que as imagens de entrada n sao nulas e que tenham a mesma largura 

  uint32 new_width = img1->width;
  uint32 new_height = img1->height + img2->height; // calcula as dimensoes da nova imagem a largura permanece a mesma, a altura é soma das alturas 

  Image newImage = AllocateImageHeader(new_width, new_height);  // aloca o cabeçalho e a estrutura basica da nova imagem com as dimensoes calculadas

  for (uint32 row = 0; row < img1->height; row++) {  // loop para copiar todas as linhas de img1
    newImage->row[row] = AllocateRLERowArray(new_width * 2 + 2); // Aloca memoria para a linha atual na nova imagem 

    const int* source_row = img1->row[row]; //obtem um ponteiro  para a linha atual de img1
    int* dest_row = newImage->row[row];      // obtem um ponteiro para a linha nova imagem onde os dados de img1 serao copiados
    uint32 index = 0;                   //declara um indice para percorrer os elementos da linha 

    while (source_row[index] != EOR) {    // Copia cada elemento da linha de img1 para a nova imagem enquanto nao encontra o marcador EOR 
      dest_row[index] = source_row[index];    
      index++;
    }

    dest_row[index] = EOR;  // Insere o marcador EOR na linha copiada na nova imagem 
  }

  for (uint32 row = 0; row < img2->height; row++) {  // Itera pelas linhas de img2 
    uint32 new_row_index = img1->height + row;       // Calcula a posiçao correta para começar a copiar as linhas de img2 na nova imagem
    newImage->row[new_row_index] = AllocateRLERowArray(new_width * 2 + 2); //Aloca memoria para a linha de img2 na nova imagem

    const int* source_row = img2->row[row];                //Obtem um ponteiro para a linha atual de img2
    int* dest_row = newImage->row[new_row_index];    // Obtem um ponteiro para a linha correspondente na nova imagem 
    uint32 index = 0;  // declara um indice para percorrer os elementos da linha de img2

    while (source_row[index] != EOR) {         // copia cada elemento da linha de img2 para a nova imagem, ate encontrar o marcador EOR
      dest_row[index] = source_row[index]; 
      index++;
    }

    dest_row[index] = EOR;  // insere o marcador EOR na linha copiada na nova imagem 
  }

  return newImage;
}

/// Replicate img2 to the right of imag1, creating a larger image
/// Requires: the height of the two images must be the same.
/// Returns the new larger image.
/// Ensures: The original images are not modified.
///
/// On success, a new image is returned.
/// (The caller is responsible for destroying the returned image!)
Image ImageReplicateAtRight(const Image img1, const Image img2) { 
  assert(img1 != NULL && img2 != NULL); // Verifica que as imagens de entrada nao sao nulas 
  assert(img1->height == img2->height); // verifica que as alturas das duas imagens sao iguais 

  uint32 new_width = img1->width + img2->width;  // calcula a largura da nova imagem como a soma das larguras de img1 e im2
  uint32 new_height = img1->height;   // define a altura da nova imagem como a mesma altura de img1

  Image newImage = AllocateImageHeader(new_width, new_height);  // aloca memoria para o cabeçalho e estrutura da nova imagem com qas dimensões calculadas 

  for (uint32 row = 0; row < new_height; row++) {  // Itera por cada linha da nova imagem 
    int* new_row = AllocateRLERowArray(new_width);  // aloca memoria para a linha resultante na nova imagem 

    //Para o lado esquerdo copiamos a img1
    for (uint32 col = 0; col < img1->width; col++) {
      new_row[col] = img1->row[row][col];    // copia os valores de cada pixel da linha row de imgh1
    }

    //Para o lado direito copiamos a img2
    for (uint32 col = img1->width; col < new_width; col++) {
      new_row[col] = img2->row[row][col - img1->width];   // Ajusta o indice de origem subtraindo para acessar corretamente os pixels de img2 
    }

    newImage->row[row] = new_row;
  }

  return newImage;
}
