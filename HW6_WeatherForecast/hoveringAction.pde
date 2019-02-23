// Funtions for hovering actions

/*****************************************************
This function identifies hovering over high temperature
curve decisions
A radius of 50 around center points of high temperature
curve for the daily data is made sensitive to hover 
action . Hovering over any daily center point on high 
temperature curve will result in display of the
corresponding high temperature value and thickening
of the high Temperature curve
*****************************************************/
boolean hoverLineHigh()
{
  boolean collision = false;
  translate(width/temps.length/2,0);
  for(int i = 0; i < temps.length; i++)
  {
   int x = (int)map(i, 0, temps.length, temps.length, width);
   int y = (int)map(tempsHigh[i], min, max, 600, 100);
   
    float distance = dist(x, y, mouseX, mouseY);
    if(distance <= 50)
    {
      hoverTemp = tempsHigh[i];
      collision = true;
      break;
    }
  }
  return collision;
}

/*****************************************************
This function identifies hovering over low temperature
curve decisions
A radius of 50 around center points of low temperature 
curve for the daily data is made sensitive to hover 
action . Hovering over any daily center point on low
Temperature curve will result in display of the 
corresponding low temperature value
and thickening of the low temperature curve
*****************************************************/
boolean hoverLineLow()
{
  boolean collision = false;
  translate(width/temps.length/2,0);
  for(int i = 0; i < temps.length; i++)
  {
   int x = (int)map(i, 0, temps.length, temps.length, width);
   int y = (int)map(tempsLow[i], min, max, 600, 100);
      
    float distance = dist(x, y, mouseX, mouseY);
    if(distance <= 50)
    {
      hoverTemp = tempsLow[i];
      collision = true;
      break;
    }
  }
 return collision;
}

/******************************************************
Hovering over curve actions
This function will display the temperature ( high/low )
based on the hover sensitive point in a white box near
the identified point.
******************************************************/
void hoverLineDisplay(){
  if ( isHoveringUp) { 
    swh=20;
    swl=10;
  }
  else if (isHoveringLow){
    swh=10;
    swl=20;
  }
    stroke(255);
    fill(255);
    rect(hoverpoint.x, hoverpoint.y, 50, 30);
    textSize(30);
    fill(0);
    text(hoverTemp, hoverpoint.x+5, hoverpoint.y+25);
}


/*****************************************************
This function identifies hovering over date/day values
A rectangular sensitive area is created around the
date/day display. Hovering over any point in the box 
will result in display of the summary for that day 
in the center in between high-temperature and 
low-temperature curves 
*****************************************************/
boolean hoverLineDate()
{
  boolean collision = false;

   int boxSize = width/temps.length;
      
  for(int i = 0; i < temps.length; i++)
  {

    if ( (mouseY > (height-55))  &(mouseY < (height-25)) )
    {
      if ( (mouseX > (boxSize*i)) & (mouseX < (boxSize*(i+1))) ) {
        hs.text = summary[i];
        hs.y = (int)map(temps[i], min, max, 600, 100);
        hs.x = hoverpoint.x-(width/temps.length)+10;
        collision = true;
        break;
     }
    }
  }
  
  return collision;
}

/******************************************************
Hovering over curve actions
This function will display the summary based on the 
hover sensitive point in between the high-temperature
and low-temperature curve just above the corresponding
date/day box of the hover point.
******************************************************/
void hoverDateDisplay(){
    textSize(15);
    fill(4,11,131);
    //fill(255);
    text(hs.text, hs.x, hs.y ,100,100); 
}

/******************************************************
This function was an attempt to create a dynamic sensitive
area around the line curves.With a radius of high-temp
minus low-temp in between the lines and a radius of
50 above high-temp curve and below the low-temp curve
Still needs some work.
******************************************************/
void hoverLine()
{
  boolean collision = false;
  Position highP = new Position();
  Position lowP = new Position();
  Position mouseP = new Position();
  float distanceH , distanceL;
  
  if ( mouseX != 0 | mouseY != 0 )
  {
      
  for(int i = 0; i < temps.length; i++)
  {
   highP.x = (int)map(i, 0, temps.length, temps.length, width);
   highP.y = (int)map(tempsHigh[i], min, max, 600, 100);
   lowP.x = (int)map(i, 0, temps.length, temps.length, width);
   lowP.y = (int)map(tempsLow[i], min, max, 600, 100);
   distanceH = dist(highP.x, highP.y, mouseX, mouseY);
   distanceL = dist(lowP.x , lowP.y , mouseX , mouseY);
     
   if ( mouseY < highP.y ){
     isHoveringLow = false;
     if (distanceH < 50){
       isHoveringUp = true;
     }
     else {
       isHoveringUp = false;
     }
     break;
   }
   else if ( mouseY > lowP.y ){
     isHoveringUp = false;
     if( distanceL < 50){
       isHoveringLow = true;
     }
     else {
       isHoveringLow = false;
     }
      break; 
   }
   else if ( mouseY >= highP.y & mouseY <= lowP.y ) {
     
    if(distanceH < distanceL)
    {
      isHoveringUp = true;
      isHoveringLow = false;
      
    }
   else if(distanceL < distanceH )
    {
      isHoveringLow = true;
      isHoveringUp = false;
    }
    break;
    }
    else
    {
      isHoveringUp = false;
      isHoveringLow = false;
    }
  }
  }
 }
