/*************************************
Submitted by : 
              Arora, Tanvi
              Luzardo, Melissa

Created on : 2019/02/01
Description : This code creates the particles 
created by lightning strike.
Code logic inspired by  Ira Greenberg's course work 
for SMU , MSDS 6390 - Visualization of Information
*****************************************/
void polygon(float x, float y, float radius , int sides , float strokeWt , color strokeCol , int bounce){
   float theta = 0;
   strokeWeight(strokeWt);
   float rotAmount = TWO_PI/sides;
   // in order to avoid lot of particles accumulate at the bottom, particles will vanish after 2 bounces
   if (bounce> 2){
      strokeCol=0; 
   }
   stroke(strokeCol);
   fill(strokeCol);
   beginShape();
     float x2=0, y2=0;
     for ( int i = 0;i < sides ; i++) {
        x2 = x + cos(theta) * radius * 2;
        y2 = y + sin(theta) * radius * 2;
        vertex(x2,y2);
        theta += rotAmount;
     }
     endShape(CLOSE);
  
}
