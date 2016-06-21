import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage img, img2;
int i;
void setup() {
  size(800, 800);
  video = new Capture(this, 800/2, 800/2);
  opencv = new OpenCV(this, 800/2, 800/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  img =loadImage("im.png");
  img2=loadImage("yurmum.png");
}



void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
//spoodermns
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    
    if(keyPressed){
      image(img2, faces[i].x-95,faces[i].y-140,faces[i].width+300,faces[i].height+300);
    }
    else{image(img, faces[i].x-95,faces[i].y-60,faces[i].width+200,faces[i].height+200);
    }
    
  }
  
  
  i++;
  println("i= ", i);
  
  if (i<70)
  {
    text("    face editor", 25,25);
    fill(43, 24, 104);
    
  }
  else if(i<170)
  {
    text(" only $10000000", 25,25);
    fill(254, 0, 0);
  }
   else if(i<200)
  {
    text(" payment is mandatory", 25,25);
    fill(254, 0, 0);
  }
   
    
  
  else if(i<250)
  {
    text("also cupcakes are now $1000000 at target", 25,25);
    fill(254, 0, 0);
  }
  else if(i<270)
  {
    text("we have chocolate", 25,25);
    fill(254, 0, 0);
  }
  else if(i<300)
  {
    text("and salsa ", 25,25);
    fill(254, 0, 0);
  }
  else if(i<330)
  {
    text("our salsa is gooder than u", 25,25);
    fill(254, 0, 0);
  }
  else if(i<350)
  {
    text("burn roasted ohhhhhhhhhhhh", 25,25);
    fill(254, 0, 0);
  }
  else if(i<370)
  {
    text("all muny gos to FUNding ayush's new rocket ship", 25,25);
    fill(254, 0, 0);
  }
  else if(i>450){
  i=0;
  }
}
void  captureEvent(Capture c) {
  c.read();
}