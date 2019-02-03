/*************************************
Submitted by : 
              Arora, Tanvi
              Luzardo, Melissa

Created on : 2019/02/01
Description : This is the main program to 
create a lightning fight effect 
*****************************************/
// create a class for a point, that can contain 2 variables x and y

public class myPoint{
  float xValue;
  float yValue;
}

// declare particle variables
int particleCount = 100000;
int particleCountCurr = 0;
int particleCountIncr = 2;

float[] x  = new float[particleCount];
float[] y = new float[particleCount];
float[] radius = new float[particleCount];
float[] speedX = new float[particleCount];
float[] speedY = new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];
float[] friction = new float[particleCount];
int[] sides = new int[particleCount];
int[] bounce = new int[particleCount];


myPoint clash = new myPoint();


void setup(){
  
  size(1000,800);
  // initialize particle variables
  for ( int i = 0; i < particleCount; i+= 1 ) {
   x[i] = 0;
   y[i] = 0;
   speedX[i] = random(-3.2 , 3.2);
   speedY[i] = random(-2.2 , 2.2);
   radius[i] = random(0.5,0.8);
   gravity[i] = 0.05;
   damping[i] = 0.05;
   friction[i] = 8;
   sides[i] = int(random(6,10));
   bounce[i]=0;
  }
}

void draw(){
// background(0,10);
// using below code instead of background will create tailing effect
   fill(0,100);
   noStroke();
   rect(-2,-2,width+2,height+2);

// create wands
strokeWeight(10); 
stroke(81,36,12); 

// left-side wand
pushMatrix();  
  translate(width/10,height/2); 
  rotate(PI/6); 
  rect(0,0, 2, height/4); 
popMatrix();

// right-side wand
pushMatrix();   
  translate(9*width/10,height/2); 
  rotate(-PI/6);  
  rect(0,0, 2, height/4); 
popMatrix();

// strike lightning 
// sets clash points as well
  strike();
  
// create particles only when the lightning clash
 if (clash.xValue != 0 | clash.yValue != 0 ) {

   // translate the particles to clash point
    translate(clash.xValue, clash.yValue);
    // creating right side of particles
    for ( int i = 0; i < particleCountCurr; i+= 1 ) {
      // create particles
      polygon(x[i] , y[i], radius[i], sides[i] , 2 , color(255, 245, 216), bounce[i]);
      // increament position of ith particle by speedX[i] and speedY[i]
      x[i] += speedX[i];
      
       // adding gravity to speedY, keeps it increasing and so the particle does not go above almost width/2, height/2 plane
      speedY[i] += gravity[i];
      y[i] += speedY[i];
    
       
    // check for collision of particle  
    checkCollisions(i);
    // creating left side of particles as mirror 
      scale (-1,1);
    }
}

// increament particle count so it gives effect of never ending lightning
  if (particleCountCurr <  particleCount){
      particleCountCurr += particleCountIncr;
  }
  
}


// each collision with bottom floor, or left/right side walls is accounted for

void checkCollisions(int i){
 if ( (x[i]) > width - radius[i] ) {
   x[i] = width - radius[i];
   speedX[i] = speedX[i] * -1;
   bounce[i]++;
 }
 
 if ( (x[i]) <  radius[i] ){
   x[i] = radius[i]   ;
  speedX[i] = speedX[i] * -1; 
  bounce[i]++;
 }
 
 if ( (y[i]) > height -  ( radius[i] ) ) {
   // points are transported to clash points , hence subtracting clashpoint y value as well
   y[i] = height - radius[i]  - clash.yValue;
   speedY[i] = speedY[i] * -1;
   speedY[i] *= damping[i];
   speedX[i] *= friction[i];
   bounce[i]++;
 }

 if ( (y[i]) < (radius[i] )) {
   y[i] = radius[i] ;
   speedY[i] = speedY[i] * -1;
 }
  
}
