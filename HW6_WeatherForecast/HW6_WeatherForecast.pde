/****************************************************
* Submitted by : 
*                Arora, Tanvi
*                Luzardo , Melissa
*  HW - 6 : Houston Temperature Forecast
*  As part of this assignment web interaction is achieved by 
*  fetching temperature forecast data from API's made available 
*  by https://darksky.net. Limited functionality is explored 
*  to create a prototype of what can be done.
* 
*  Created date : 02/18/2019
****************************************************/

public class Position
{
 int x;
 int y;
}

public class HoverSummary
{
  String text;
  int x;
  int y;
}

PFont Font1;
PImage myBackground;
JSONObject myObject;
String[] times;

int temp;
String sum;
int[] tempsHigh;
int[] tempsLow;
int[] temps;
String[] summary;

int tempColLow;
int tempColHigh;
int minTemp, maxTemp, maxHigh, minHigh, maxLow, minLow, min, max;
boolean isHoveringUp, isHoveringLow, isHoveringDate;
int swh=10;
int swl=10;
int hoverTemp;
String hoverText;
HoverSummary hs = new HoverSummary();

Position hoverpoint = new Position();

void settings(){
   myBackground = loadImage("Houston.jpg");
  int myWidth = myBackground.width;
  int myHeight = myBackground.height;
  size(myWidth, myHeight);
  //print("size of canvas " + myWidth + " " + myHeight);
}
  
void setup()
{
  //fetch initial data and display screen based on data received
  initialData();
}

void draw()
{
  //Data update
  setBackground();

  hoverpoint.x= mouseX;
  hoverpoint.y = mouseY;
 
  // Temperature Curves   
 pushMatrix();
     translate(width/temps.length/2,0);
     //High temperature curve
     lineHigh(swh);
     //Low temperature curve
     lineLow(swl);
     
     // Hovering over curves
      if(isHoveringUp)
      {
        hoverLineDisplay();
       }
       else if(isHoveringLow)
      {
         hoverLineDisplay();
      }
      else // reset strokeWeight values in case no hovering over line graph
      {
        swh=10;
        swl=10;
      }
     
     //Hovering over date/day 
      if(isHoveringDate)
      {
         hoverDateDisplay();
      }
 
 popMatrix(); 
    
     dateAvgTemp();
  
    isHoveringUp = hoverLineHigh();
    isHoveringLow = hoverLineLow();
    isHoveringDate = hoverLineDate();
}
