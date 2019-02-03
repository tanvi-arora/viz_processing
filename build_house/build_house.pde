// build a house

void setup() {
 size(800,700);
 background(255);
 
 // house dimensions
 float houseWidth = width * 0.8;
 float houseHeight = height * 0.6;
 
 float deltaWidth = width - houseWidth;
 float deltaHeight = height - houseHeight;
 
 // variables for roof
 float x0 =deltaWidth/2  , y0=deltaHeight;
 float x1 = width/2, y1=0;
 float x2 = deltaWidth/2 +houseWidth  , y2 = deltaHeight;
 
 //  variables for door
 float doorWidth = houseWidth * .1;
 float doorHeight = houseHeight * .4;
 
// creates a black border of weight 5
 strokeWeight(5);
 // removes the black border and merges with the color of the rectangle
 noStroke();
 
 // draw base
 fill(100,50, 20);
 rect(deltaWidth/2, deltaHeight , houseWidth,houseHeight);
 
 // draw roof
 fill(40, 10 , 50);
 triangle(x0,y0,x1,y1,x2,y2);
 
 // draw door
 fill(200, 5 , 7);
 rect( width/2 - doorWidth/2 , height -doorHeight , doorWidth, doorHeight);
 

}
