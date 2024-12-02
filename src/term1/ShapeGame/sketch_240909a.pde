// Henry Baldwin | Shape Game | 9 Sept 2024
import processing.sound.*;
int x, y, score, tx, ty, tw, speed;
PImage user1;
PImage target1;
PImage bg01;
SoundFile e1;

void setup() {
  size(500, 500);
  background(246, 255, 152);
  user1 = loadImage("Yorke.png");
  target1 = loadImage("target1.png");
  bg01 = loadImage("InR2.png");

  e1 = new SoundFile(this, "ra.wav");

  user1.resize(50, 50);

  x = width/2;
  y = height/2;
  score = 0;
  tx = int(random(width));
  ty = int(random(height));
  tw = 100;
  speed = 10;
}

void draw() { // draw runs of a 30 fps rate
  frameRate(speed + 20);
  background(bg01);


  score();

  if (keyPressed) {
    if (key == 'w' || key == 'W' ) {
      y = y-10;
    } else if (key == 's' || key == 'S' ) {
      y = y+10;
    } else if (key == 'a' || key == 'A' ) {
      x = x-10;
    } else if (key == 'd' || key == 'D' ) {
      x = x+10;
    }
  }
  target();
  fill(20, 230, 255);
  imageMode(CENTER);
  image(user1, x, y);
  //ellipse(x, y, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y-1;
    } else if (keyCode == DOWN) {
      y = y+1;
    } else if (keyCode == LEFT) {
      x = x-1;
    } else if (keyCode == RIGHT) {
      x = x+1;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(190);
  rect(width/2, 20, width, 40);
  fill(0);
  textSize(30);
  text("Score: " + score, 20, 35);
}

void target() {
  imageMode(CENTER);
  image(target1, tx, ty, tw, tw);
  //rectMode(CENTER);
  //fill(40, 80, 200)
  //rect(tx, ty, tw, tw);
  tw--;
  //target1.resize(tx, tw);
  if (tw < 1)
  {
    gameOver();
  }
  if (dist(x, y, tx, ty)<25 + tw/2) {
    e1.play();
    score = score + 100;
    tx = int(random(width));
    ty = int(random(height));
    tw = 100;
    speed ++;
  }
}

void gameOver () {
  background (0);
  textAlign(CENTER);
  textSize(40);
  fill(40, 80, 200);
  text("Game Over!", width/2, height/2);
  text("Score:"+  score, width/2, height/3);
  noLoop();
}
