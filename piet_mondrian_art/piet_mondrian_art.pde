// Piet Mondrian Art Recreation
// Submitted by Tanvi Arora and Melissa Luzardo
// SMU MSDS 6390 - Assignment 1

void setup()
{
// setting up canvas
  // to reflect size of canvas in the painting, update the variable values defined in draw() cv_l = canvas length , cv_w = canvas width
  size(500,500);
  background(240);
  rectMode(CORNER);
 
  
}

void draw(){
    float cv_l=500;
   float cv_w=500;
   // stroke features
   float def_stroke_w = ((cv_l+cv_w)/2)*0.015;
   strokeWeight(def_stroke_w);
   strokeCap(SQUARE);
   
  // diagonal lines for reference -- to be deleted once drawing is complete
  //line(0,0,cv_l,cv_w);
  //line(0,cv_l,cv_w,0);
  
  //define center
  float c_x = cv_w/2;
  float c_y = cv_l/2;
  
  //define external coloured rectangles
  //top left most corner grey rectangle
  float tl_x = 0;
  float tl_y = 0;
  float tl_w = cv_w*0.2;
  float tl_l = cv_l*0.1;
  
  strokeWeight(0);
  stroke(208,219,234);
  fill(208,219,234);
  rect(tl_x,tl_y,tl_w,tl_l);
  
  stroke(0);
  strokeWeight(def_stroke_w);
  
  //define big_red_rectangle
  float br_x = cv_w*0.1;
 float br_y = cv_l*0.1;
 float br_w = cv_w*0.51;
 float br_l = cv_l*0.51;
 
// fill(255,50,0);
// rect(br_x,br_y,br_w,br_l);
 
 //define top right second yellow rectangle with all 4 defined edges
 float try_x = br_x+br_w;
 float try_y = br_y;
 float try_w = (cv_w*0.35);
 float try_l = (br_l*0.5);
 
 // define top right yellow with un-defined edge
 float y_x = try_x;
 float y_y = 0;
 float y_w = cv_w*0.35;
 float y_l = br_y;
 
 // draw the yellow rectangles
 // top 2 on right corner
 
 fill(240,195,0);
 stroke(240,195,0);
 strokeWeight(0);
 rect(y_x,y_y,y_w,y_l);
 
 stroke(0);
 strokeWeight(def_stroke_w);
// fill(240,195,0);
// rect(try_x,try_y,try_w,try_l);
 
 
 // define vertical rectangles underneath yellow 
 
 float uyr1_x = try_x;
 float uyr1_y = try_y+try_l;
 float uyr1_w = try_w;
 float uyr1_l = try_l;
 
// fill(255);
// rect(uyr1_x,uyr1_y,uyr1_w,uyr1_l);
// rect(uyr1_x,uyr1_y,uyr1_w/2,uyr1_l);
 
 // define horizontal rectangles in yellow lane
 
 float uyr2_x = try_x;
 float uyr2_y = try_y+br_l;
 float uyr2_w = try_w;
 float uyr2_l = cv_l*0.33;
 
 // rect(uyr2_x, uyr2_y, uyr2_w, uyr2_l);
 
 // define red rectangle on right bottom
 
 float rbr_x = uyr1_x + uyr2_w;
 float rbr_y = uyr2_y + (0.4*uyr2_l);
 float rbr_w = cv_w - rbr_x;
 float rbr_l = cv_l - rbr_y;
 
 fill(255,50,0);
 stroke(255,50,0);
 strokeWeight(0);
 rect(rbr_x,rbr_y,rbr_w,rbr_l);
 
 // define grey rectangle in left corner above red
 
 float gtr_x = uyr1_x + uyr2_w;
 float gtr_y = 0;
 float gtr_w = cv_w - gtr_x;
 float gtr_l = uyr2_y + (0.4*uyr2_l);
 
 // define grey rectangle on left middle
 
 float glm_x = 0;
 float glm_y = try_y+try_l;
 float glm_w = br_x;
 float glm_l = br_l/2 + (0.4*uyr2_l);
 
 
 stroke(208,219,234);
 fill(208,219,234);

 // add grey rectangle in left corner above red
 rect(gtr_x, gtr_y, gtr_w, gtr_l);

 // add grey left middle rectabgle
 rect(glm_x, glm_y, glm_w, glm_l);
 
 stroke(0);
 strokeWeight(def_stroke_w);
 
 // add yellow top right rectangle
 fill(240,195,0);
 rect(try_x,try_y,try_w,try_l);
 
 // add rectangles underneath top right yellow
 fill(255);
 rect(uyr1_x,uyr1_y,uyr1_w,uyr1_l);
 rect(uyr1_x,uyr1_y,uyr1_w/2,uyr1_l);
 
 // add horizontal white rectangle above blue
 rect(uyr2_x, uyr2_y, uyr2_w, uyr2_l);
 
 
 // blu3 rectangle
 fill(00,50,100);
 rect(uyr1_x, uyr2_y + (0.4*uyr2_l),uyr2_w,0.6*uyr2_l); 
 
  // define plain horizontal rectangles left to blue rectangle
  
  float urr1_x = br_x + (br_w/2);
  float urr1_y = try_y + br_l;
  float urr1_w = br_w/2;
  float urr1_l = 0.8*uyr2_l;
  
  fill(208,219,234);
  rect(urr1_x,urr1_y,urr1_w,urr1_l);
  rect(urr1_x,urr1_y,urr1_w,urr1_l/2);
  
  fill(255);
  
   // left bottom yellow on the oustide
 float lby_x = 0;
 float lby_y =  uyr2_y + (0.4*uyr2_l);
 float lby_w = br_x;
 float lby_l = cv_l - (br_y + br_l + (0.2 * uyr2_l));
 
 fill(240,195,0);
 stroke(240,195,0);
 strokeWeight(0);
 rect(lby_x, lby_y, lby_w, lby_l);
 stroke(0);
 strokeWeight(def_stroke_w);
 
  //define black rectangle adjacent to blue;
  
  float blb_x =urr1_x ;
  float blb_y = urr1_y + urr1_l;
  float blb_w = br_w/2;
  float blb_l = 0.2*uyr2_l;
  
  
  fill(10);
  rect(blb_x, blb_y, blb_w, blb_l);
  
  // big black rectangle under red
  
  float bl_x = br_x;
  float bl_y = br_y + br_l;
  float bl_w = br_w/2;
  float bl_l = 0.8 * uyr2_l;
  
  rect(bl_x, bl_y, bl_w, bl_l);
  
  // add big red rectangle 
   fill(255,50,0);
 rect(br_x,br_y,br_w,br_l);
  
  
  // draw extending lines
  
  // top left of big red
  line(0.025*cv_w, br_y, br_x,br_y);
  // vertical line for top left corner grey
  line(cv_w*0.2, cv_l*0.025, cv_w*0.2,cv_l*0.1);
  // top horizontal line for left middle grey
  line(cv_w*0.025,glm_y , br_x,glm_y );
  // top horizontal line for left corner yellow
  line(cv_w*0.025,lby_y , rbr_x,lby_y );
  // vertical right for left bottom corner yellow
  line(br_x, bl_y + bl_l ,br_x , (1-0.025)*cv_l);
  // middle vertical line for big black box
  line(br_x+br_w/4,br_y+br_l,br_x+br_w/4 , bl_y + bl_l);
   // left edge for bottom black
   line(blb_x,blb_y+blb_l, blb_x,(1-0.015)*cv_l);
  // left edge for right bottom red
  line(rbr_x, rbr_y , rbr_x , (1-0.015)*cv_l);
  // top horizontal for bottom right red
  line(rbr_x,rbr_y,cv_w,rbr_y);
  // left edge for top right yellow
  line(try_x,(0.015*cv_l),try_x,try_y);
  // right edge for top right yellow
  line(gtr_x,(0.025*cv_l),gtr_x, try_y);
}
