/****************************************************
* Submitted by : 
*                Arora, Tanvi
*                Luzardo , Melissa
*  HW -5 : Image Processing
*  In this assignment different convolution kernels
*  have been used on an image. Image has been placed 
*  in inverted , straight as well as mirror-style
*  Created date : 02/09/2019
****************************************************/

PImage img; 
int canvasWidth = 0;
int canvasHeight = 0;

// pre-defined convolution kernels

static int[][] EDGES_KERNEL = {
  {-1, -1, -1},
  {-1, 8, -1},
  {-1, -1, -1},
};

static int[][] EMBOSS_KERNEL = {
  {1, 1, 1},
  {1, -7, 1},
  {1, 1, 1},
};

static int[][] SHARP_KERNEL = {
  { -1 , -1 , -1 },
  { -1 , 9 , -1 },
  { -1 , -1 , -1 }
};

final static int[][] BLUR_KERNEL = {
  {1, 1, 1},
  {1, 1, 1},
  {1, 1, 1},
};

void settings()
{
  img = loadImage("flower.JPG");
  canvasWidth = img.width;
  canvasHeight = img.height;
  // 3X3 matrix is created for image
  size(canvasWidth*3, canvasHeight*3); 
}

void setup(){ 
  //Original image
  image(img, width/3, height/3);
  
   //Mirror Image - image has been mirrored from left to right
  PImage mirror_img = createImage(img.width,img.height,RGB );
    for ( int y = 1; y < img.height-1 ; y++){
     for ( int x = 1; x < img.width-1 ; x ++ ) {
        int pos_orig =  ((y+1)*img.width)-x;
        int pos_mirr = y*img.width + x;
        float red = red(img.pixels[pos_orig]);
        float green = green(img.pixels[pos_orig]);
        float blue = blue(img.pixels[pos_orig]);
        mirror_img.pixels[pos_mirr] = color(red,green,blue);
     }
   }
   
   //Inverted Image
  PImage inv_img = createImage(img.width,img.height,RGB );
    for(int y = 0; y < img.height; y++){
      for(int x = 0; x < img.width; x++){
             inv_img.set(x,img.height-y-1,img.get(x,y));
     }
    }
  
  //Inverted mirror Image
PImage inv_mirror_img = createImage(img.width,img.height,RGB );
    for(int y = 0; y < img.height; y++){
      for(int x = 0; x < img.width; x++){
          inv_mirror_img.set(img.width-x-1,img.height-y-1,img.get(x,y));
     }
    }
    
    //Pointillist image from inverted image
  PImage POINTImage = createImage(inv_mirror_img.width, inv_mirror_img.height, RGB);
  int pointillize = 10;
 POINTImage.loadPixels();
  for(int y = 0; y < inv_mirror_img.height-1; y++){
      for(int x = 0; x < inv_mirror_img.width-1; x++){
          x = int(random(inv_mirror_img.width));
          y = int(random(inv_mirror_img.height));
        int pos = x + y*inv_mirror_img.width;
        float r = red(inv_mirror_img.pixels[pos]);
        float g = green(inv_mirror_img.pixels[pos]);
      float b = blue(inv_mirror_img.pixels[pos]);
      noStroke();
      fill(r,g,b,100);
      ellipse(x,y,pointillize,pointillize) ; 
  POINTImage.updatePixels();
    }
  }
  
  //Brigthen image from inverted mirrow image
    PImage BriImage = createImage(inv_img.width, inv_img.height, RGB);
    for ( int y = 1; y < inv_img.height-1 ; y++){
     for ( int x = 1; x < inv_img.width-1 ; x ++ ) {
        int pos_inv = y*img.width + x;
        int pos_bri = pos_inv;
        float red = 2*red(inv_img.pixels[pos_bri]);
        float green = 2*green(inv_img.pixels[pos_bri]);
        float blue = 2*blue(inv_img.pixels[pos_bri]);
        BriImage.pixels[pos_bri] = color(red,green,blue);
     }
   }
   
   //Black and White image from inverted mirrow
  PImage BandWImage = createImage(inv_mirror_img.width, inv_mirror_img.height, RGB);
  float threshold = 127;
  inv_mirror_img.loadPixels();
  BandWImage.loadPixels();
    for ( int y = 1; y < inv_mirror_img.height ; y++){
     for ( int x = 1; x < inv_mirror_img.width ; x ++ ) {
        int pos_inv = y*inv_mirror_img.width + x;
         if (brightness(inv_mirror_img.pixels[pos_inv]) > threshold) {
           BandWImage.pixels[y*inv_mirror_img.width + x]  = color(255);  
            }  
            else {
             BandWImage.pixels[y*inv_mirror_img.width + x]  = color(0);    
             }
  BandWImage.updatePixels();
       }
    }
      
  //Sharpen image from mirror image
  PImage SHARPImage = createImage(mirror_img.width, mirror_img.height, RGB);
  SHARPImage.loadPixels();
  for (int y = 1; y < mirror_img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < mirror_img.width-1; x++) {  // Skip left and right edges
      float red = 0; // Kernel sum for this pixel
      float green = 0; // Kernel sum for this pixel
      float blue = 0; // Kernel sum for this pixel
        for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*mirror_img.width + (x + kx);
          //println("y : "+ "x : " + "ky : "+"kc : ");
          // println(y + " : " + x + " : " + ky + " : " + kx);
          float valR = red(mirror_img.pixels[pos]);
          float valG = green(mirror_img.pixels[pos]);
          float valB = blue(mirror_img.pixels[pos]);
          red += SHARP_KERNEL[ky+1][kx+1] * valR;
          green += SHARP_KERNEL[ky+1][kx+1] * valG;
          blue += SHARP_KERNEL[ky+1][kx+1] * valB;
        }
      }
          SHARPImage.pixels[y*mirror_img.width + x] = color(red / 1, green / 1, blue / 1);
  SHARPImage.updatePixels();
    }
  }            
          
  //Negative image from mirror
  PImage NEGImage = createImage(mirror_img.width, mirror_img.height, RGB);
    for ( int y = 1; y < mirror_img.height-1 ; y++){
     for ( int x = 1; x < mirror_img.width-1 ; x ++ ) {
        int pos_mirr = y*img.width + x;
        int pos_neg = pos_mirr;
        float red = 255-red(mirror_img.pixels[pos_neg]);
        float green = 255-green(mirror_img.pixels[pos_neg]);
        float blue = 255-blue(mirror_img.pixels[pos_neg]);
        NEGImage.pixels[pos_neg] = color(red,green,blue);
     }
   }

//Blurred image from inverted mirror image
  PImage BLURImage = createImage(inv_mirror_img.width, inv_mirror_img.height, RGB);
  BLURImage.loadPixels();
  for (int y = 1; y < inv_mirror_img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < inv_mirror_img.width-1; x++) {  // Skip left and right edges
    float red = 0; // Kernel sum for this pixel
      float green = 0; // Kernel sum for this pixel
      float blue = 0; // Kernel sum for this pixel
        for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*inv_mirror_img.width + (x + kx);
          float valR = red(inv_mirror_img.pixels[pos]);
          float valG = green(inv_mirror_img.pixels[pos]);
          float valB = blue(inv_mirror_img.pixels[pos]);
          red += BLUR_KERNEL[ky+1][kx+1] * valR;
          green += BLUR_KERNEL[ky+1][kx+1] * valG;
          blue += BLUR_KERNEL[ky+1][kx+1] * valB;
        }
      }    
        BLURImage.pixels[y*inv_mirror_img.width + x] = color(red/9, green/9, blue/9);
   BLURImage.updatePixels();
    }
  }
 
 //Embosses image from inverted image 
  PImage EMBOSSImage = createImage(inv_img.width, inv_img.height, RGB);
  EMBOSSImage.loadPixels();
  for (int y = 1; y < inv_img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < inv_img.width-1; x++) {  // Skip left and right edges
      float red = 0; // Kernel sum for this pixel
      float green = 0; // Kernel sum for this pixel
      float blue = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*inv_img.width + (x + kx);
          float valR = red(inv_img.pixels[pos]);
          float valG = green(inv_img.pixels[pos]);
          float valB = blue(inv_img.pixels[pos]);
          red += EMBOSS_KERNEL[ky+1][kx+1] * valR;
          green += EMBOSS_KERNEL[ky+1][kx+1] * valG;
          blue += EMBOSS_KERNEL[ky+1][kx+1] * valB;
        }
      }      
        EMBOSSImage.pixels[y*inv_img.width + x] = color(red / 1, green / 1, blue / 1);
  EMBOSSImage.updatePixels();
    }
  }
    
 //Edges from inverted mirror image
  PImage EDGEImage = createImage(inv_mirror_img.width, inv_mirror_img.height, RGB);
  EDGEImage.loadPixels();
  for (int y = 1; y < inv_mirror_img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < inv_mirror_img.width-1; x++) {  // Skip left and right edges
    float red = 0; // Kernel sum for this pixel
      float green = 0; // Kernel sum for this pixel
      float blue = 0; // Kernel sum for this pixel
        for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*inv_mirror_img.width + (x + kx);
          float valR = red(inv_mirror_img.pixels[pos]);
          float valG = green(inv_mirror_img.pixels[pos]);
          float valB = blue(inv_mirror_img.pixels[pos]);
          red += EDGES_KERNEL[ky+1][kx+1] * valR;
          green += EDGES_KERNEL[ky+1][kx+1] * valG;
          blue += EDGES_KERNEL[ky+1][kx+1] * valB;
        }
      }
          EDGEImage.pixels[y*inv_mirror_img.width + x] = color(red, green, blue);
   EDGEImage.updatePixels();
    }
  }
  
  image(BriImage, width/3, 0); 
  image(BandWImage, 2*width/3, 0); 
  image(SHARPImage, 0, height/3); 
  image(NEGImage, 2*width/3, height/3); 
  image(BLURImage,0, 2*height/3); 
  image(EMBOSSImage,  width/3, 2*height/3); 
  image(EDGEImage, 2*width/3, 2*height/3);  
}
