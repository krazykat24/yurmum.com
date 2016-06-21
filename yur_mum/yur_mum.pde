import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage img, img2;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  img =loadImage("im.png");
  img2=loadImage("yurmum.jpg");
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
    
if(keyPressed){image(img2, faces[i].x-53,faces[i].y-25,faces[i].width+100,faces[i].height+100);
}
else{image(img, faces[i].x-53,faces[i].y-25,faces[i].width+100,faces[i].height+100);

}
void  captureEvent(Capture c) {
  c.read();
}