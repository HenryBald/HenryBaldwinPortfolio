class Powerup {
  // Member Variables
  int x, y, diam, speed;
  //PImage rImage;
  char type;

  // Constructor
  Powerup() {
    x=int(random(width));
    y = -250;
    speed = int(random(3, 6));
    diam = int(random(100, 200));
    int rand = int(random(10));
    if (rand == 0) {
      type = 'a';
    } else if (rand == 1) {
      type = 'b';
    } else if (rand == 2 || rand == 3 || rand == 4 || rand == 5 || rand == 6 || rand == 7|| rand == 8 || rand == 9) {
      type = 'c';
    }
  }

  //Member Metthods

  void display() {
    if (type == 'a') {
      fill(255, 0, 0);
    } else if (type == 'b') {
      fill(0, 255, 0);
    } else if (type == 'c') {
      fill(0, 0, 255);
    }
    rect(x, y, 50, 50);
    imageMode(CENTER);
    //rImage.resize(diam, diam);
    //image(rImage, x, y);
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
    if  (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
