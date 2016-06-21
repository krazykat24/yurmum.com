import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage img, img2;

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
}
void  captureEvent(Capture c) {
  c.read();
}