class Powerup {
  // Member Variables
  int x, y, diam, speed;
  PImage pwrpImage;
  char type;

  // Constructor
  Powerup() {
    x=int(random(width));
    y = -250;
    speed = int(random(3, 6));
    diam = 100;
    int rand = int(random(10));
    if (rand == 0) {
      type = 'a';
    } else if (rand == 1) {
      type = 'b';
    } else if (rand == 2 || rand == 3 || rand == 4 || rand == 5 || rand == 6 || rand == 7|| rand == 8 || rand == 9) {
      type = 'c';
    }
    if (type == 'a') {
      if (fred.turretCount<5) {
        pwrpImage = loadImage("SpaceGameTurret.png");
      } else {
        pwrpImage = loadImage("SpaceGameClear.png");
      }
    } else if (type == 'b') {
      pwrpImage = loadImage("SpaceGameHP.png");
    } else if (type == 'c') {
      pwrpImage = loadImage("SpaceGameAmmo.png");
    }
  }

  //Member Metthods

  void display() {
    imageMode(CENTER);
    pwrpImage.resize(diam, diam);
    image(pwrpImage, x, y);
  }



  void move() {
    y+=speed;
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

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if  (d<100) {
      return true;
    } else {
      return false;
    }
  }
}
