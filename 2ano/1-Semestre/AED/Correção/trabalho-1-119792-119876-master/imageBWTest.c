// imageBWTest - A program that performs some image processing.
//
// This program is an example use of the imageBW module,
// a programming project for the course AED, DETI / UA.PT
//
// You may freely use and modify this code, NO WARRANTY, blah blah,
// as long as you give proper credit to the original and subsequent authors.
//
// The AED Team <jmadeira@ua.pt, jmr@ua.pt, ...>
// 2024

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "imageBW.h"
#include "instrumentation.h"


int main(int argc, char* argv[]) {
  if (argc != 1) {
    fprintf(stderr, "Usage: %s  # no arguments required (for now)\n", argv[0]);
    exit(1);
  }

  // To initalize operation counters
  ImageInit();

  // Creating and displaying some images
  Image white_image = ImageCreate(10,1, WHITE);
  ImageRAWPrint(white_image);

  Image black_image = ImageCreate(10, 1, WHITE);
  ImageRAWPrint(black_image);
  // Image chessWhite = ImageCreateChessboard(4,4,1,WHITE); 
  // Image chessBlack = ImageCreateChessboard(4,4,1,BLACK); 
  Image image_1 = ImageNEG(white_image);
  ImageRAWPrint(image_1);

//   if(ImageIsEqual(chessWhite, chessBlack)){
//     ImageRAWPrint(chessWhite);
//     ImageRAWPrint(chessBlack);
//     printf("images are equal!\n");
// }
//     else{
//         printf("images are not equal\n");
//     }
//   printf("Not-mirrored image:\n");
//   ImageRAWPrint(chessBlack);
//   Image horizontalMirror = ImageHorizontalMirror(chessBlack);
//   printf("Mirrored Image:\n");
//   ImageRAWPrint(horizontalMirror);
//   Image atRight = ImageReplicateAtRight(chessWhite,chessWhite);
//   ImageRAWPrint(chessWhite);
//   ImageRAWPrint(chessWhite);
//   ImageRAWPrint(atRight);
//   ImageRLEPrint(chessWhite);
//   ImageRLEPrint(chessWhite);
//   ImageRLEPrint(atRight);
//   ImageDestroy(&atRight);

  //UNCOMMENT TO TEST THE NEXT FUNCTIONS

  Image image_2 = ImageReplicateAtBottom(white_image, black_image);
  ImageRAWPrint(image_2);

  
  printf("image_1 AND image_1\n");
  Image image_3 = ImageAND(image_1, image_1);
  ImageRAWPrint(image_3);
  
  // printf("image_1 AND image_2\n");
  // Image image_4 = ImageAND(image_1, image_2);
  // ImageRAWPrint(image_4);

  
  // printf("image_1 OR image_2\n");
  // Image image_5 = ImageOR(image_1, image_2);
  // ImageRAWPrint(image_5);

  printf("image_1 XOR image_1\n");
  Image image_6 = ImageXOR(image_1, image_1);
  ImageRAWPrint(image_6);

  // printf("image_1 XOR image_2\n");
  // Image image_7 = ImageXOR(image_1, image_2);
  // ImageRAWPrint(image_7);

  // Image image_8 = ImageReplicateAtRight(image_6, image_7);
  // ImageRAWPrint(image_8);

  Image image_9 = ImageReplicateAtRight(image_6, image_6);
  ImageRAWPrint(image_9);

  Image image_10 = ImageHorizontalMirror(image_1);
  ImageRAWPrint(image_10);

  // Image image_11 = ImageVerticalMirror(image_8);
  // ImageRAWPrint(image_11);


  
  // Housekeeping
  ImageDestroy(&white_image);
  ImageDestroy(&black_image);
  ImageDestroy(&image_1);
  //ImageDestroy(&chessWhite);
  ////ImageDestroy(&horizontalMirror);
  //UNCOMMENT IF YOU CREATE THOSE IMAGES

  ImageDestroy(&image_2);
  ImageDestroy(&image_3);
  //ImageDestroy(&image_4);
  
  //ImageDestroy(&image_5);
  ImageDestroy(&image_6);
  //ImageDestroy(&image_7);
  //ImageDestroy(&image_8);
  ImageDestroy(&image_9);
  ImageDestroy(&image_10);
  //ImageDestroy(&image_11);
  

  return 0;
}
