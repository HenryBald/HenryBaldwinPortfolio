class Rock {
  // Member Variables
  int x, y, diam, speed, xspeed, health;
  PImage rImage;
  char type;
  boolean rightWard;

  // Constructor
  Rock() {
    xspeed = 1;
    x=int(random(width));
    int rInt = int(random(0, 10));
    if (rInt==0 || rInt==1 || rInt == 4 || rInt == 5 || rInt == 6 || rInt == 7 || rInt ==8) {
      type = 'b';
    } else if (rInt==2 || rInt==3) {
      type = 'c';
    } else {
      type = 'a';
    }

    if (type == 'a') {
      y = -250;
      speed = 1;
      diam = int(random(350, 600));
      health = 400*levelMult;
      rImage = loadImage("r1(2).png");
    } else if (type == 'b') {
      y = -250;
      speed = int(random(3, 6));
      diam = int(random(100, 200));
      health = 150*levelMult;
      if (x<width/2) {
        rightWard = true;
      } else {
        rightWard = false;
      }
      if (rightWard) {
        rImage = loadImage("r2Mirrored.png");
      } else {
        rImage = loadImage("r2.png");
      }
    } else {
      y = -250;
      speed = int(random(1, 4));
      diam = 100;
      rImage = loadImage("r3.png");
      health = 999999999;
    }
  }

  //Member Metthods

  void display() {
    imageMode(CENTER);
    if (diam>0) {
      rImage.resize(diam, diam);
      image(rImage, x, y);
    }
  }


  void move() {

    if (type=='a') {
      y+=speed;
    } else if (type == 'b') {
      y+=speed;
      if (!rightWard) {
        x+=-xspeed;
      } else {
        x+=xspeed;
      }
    } else if (type == 'c') {
      y+=speed;
    }
  }


  void spawn() {
  }

  boolean reachedBottom() {
    if  (y>height+300) {
      return true;
    } else {
      return false;
    }
  }
}
