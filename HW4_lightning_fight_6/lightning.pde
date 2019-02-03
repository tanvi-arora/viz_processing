/*************************************
Submitted by : 
              Arora, Tanvi
              Luzardo, Melissa

Created on : 2019/02/01
Description : This code creates the 2 
lightning that strike at a random speed.
Code logic inspired by Dan Gerdes code in 
www.openprocessing.org
https://www.openprocessing.org/sketch/294352
*****************************************/

void strike(){
  
    //Lightning left
  float xL;
  float yL;
  float xSpeedL;
  float diameterL;
  float radiousL;
  xL = width/10;
  yL = height/2  ;
  diameterL = random(2, 10);
  radiousL = random(0, 50);
  xSpeedL = random(0.5, 2.5);
  float xR;
  xR = 9*width/10;
  //Lightning left
  for (int j = 0; j < 7*width/8-xL; j++) {
        //Lightning left
    noStroke();
    fill(190, 236, 255, random(100, 255));
    ellipse(xL, yL, diameterL, diameterL);
    xL = xL + xSpeedL;
    yL = yL + random(-2, 2);
     if (xL > xR) {
      xL = xR;}
       
        
        //Lightning right
    noStroke();
    fill(255, 114, 111, random(100, 255));
    ellipse(xR, yL, diameterL, diameterL);
    xR = xR - xSpeedL;
    yL = yL + random(-2, 2);
    if (xR < xL) {
      xR = xL;
    }
    
    if (xR==xL){
       //clash 
       clash.xValue = xR;
       clash.yValue = yL;
       stroke(255, 245, 216);
       fill(255, 245, 216);
       clash(xR, yL, diameterL, radiousL, int(diameterL));
      }
     
      
  }
   
}
