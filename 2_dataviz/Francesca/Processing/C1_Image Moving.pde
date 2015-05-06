//This sketch makes an image move from a file stored locally. 
//The initial idea is to use get.image to save every images generated as identicon based on the ip and load them instead immediately in this sketch.

PImage start, moving; //since I have two images moving in different ways, I need too variables for the same function

void setup() {
  size (600, 600); //sets the size 
  imageMode (CENTER); //sets the anchor point of the image
  start = loadImage("identicon.png");
  moving = loadImage("identicon.png");
}




void draw() {

  background(255); //erases the previous images
  image(start, frameCount%width, 300 ); //makes the image move from left to right along the y axis
  image(moving, 200, frameCount%height); //makes the image move from top to button along the x axis
}
