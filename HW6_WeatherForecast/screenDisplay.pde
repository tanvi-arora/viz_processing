/**************************************************
This function sets the background with Houston 
skyline image and displays the current temperature
**************************************************/

void setBackground(){
 
  // background title and current conditions setup
  textFont(Font1);
  background(myBackground);
  noFill();
  textSize(40);
  fill(0);
  text("Houston Weekly Temperature Forecast", 40, 70);
  textSize(20);
  fill(22,20,255);
  text("Current", 40, 110);
  text(sum, 40, 210 , 200, 100);
  textSize(100);
  fill(22,20,255);
  text(temp +" F", 40, 200);
  noFill();
  
}

/**************************************************
This function creates the high temperature curve
**************************************************/
void lineHigh(int sw)
{
  strokeWeight(sw);  
  beginShape();
    noFill();
    stroke(232,7,3);
    int x1 = (int)map(0, 0, tempsHigh.length,0, width);
    int y1 = (int)map(tempsHigh[0], min, max, 600, 100);
    curveVertex(x1, y1);
  for(int i = 0; i < temps.length; i++)
  {    
     x1 = (int)map(i, 0, tempsHigh.length, 0, width);
     y1 = (int)map(tempsHigh[i], min, max, 600, 100);
    curveVertex(x1, y1);
  }
    x1 = (int)map(tempsHigh.length, 0, tempsLow.length,0, width);
    y1 = (int)map(tempsHigh[tempsHigh.length-1], min, max, 600, 100);
    curveVertex(x1, y1);
 endShape();
 
  
}


/**************************************************
This function creates the low temperature curve
**************************************************/
void lineLow(int sw)
{
  strokeWeight(sw);   
  beginShape();
   noFill();
   stroke(47,71,232);
    int x2 = (int)map(0, 0, tempsLow.length,0, width);
    int y2 = (int)map(tempsLow[0], min, max, 600, 100);
    curveVertex(x2, y2);
  for(int i = 0; i < temps.length; i++)
  {
     x2 = (int)map(i, 0, tempsLow.length,0, width);
     y2 = (int)map(tempsLow[i], min, max, 600, 100);
    curveVertex(x2, y2);
    }
    x2 = (int)map(tempsLow.length, 0, tempsLow.length,0, width);
    y2 = (int)map(tempsLow[tempsLow.length-1], min, max, 600, 100);
    curveVertex(x2, y2);
 endShape();
    
}


/**************************************************
This function creates bar-chart based on the average 
daily temperature for the upcoming week along with 
the average temperature displayed in the bar. 
Also date and day values are added at the bottom
**************************************************/
void dateAvgTemp()
{
    strokeWeight(10);
    for(int i = 0; i < temps.length; i++)
  {
    pushMatrix();
    translate(0, height-100);
    scale(1,-1);
    fill(255,175,47);
    stroke(255);
    // creates bar graph for the average temperature for each day of upcoming week
    rect(i*width/temps.length, 0, width/temps.length, 1.5*temps[i]);
    textSize(30);
    fill(0);
    popMatrix();
    pushMatrix();
    translate(0, height-100);
    text(temps[i]+" F", i*width/temps.length+35, -20);
    textSize(20);
    fill(255);
    // adds blocks of date and day values for the upcoming week for which forecast is available
    text(times[i].split(",")[0], i*width/temps.length+5, 45);
    text(times[i].split(",")[1], i*width/temps.length+5, 75);
    popMatrix();
  }
}
