class PianoKey {

  // Member variables
  int x, y, w, h;
  color c1, c2;
  String note;
  boolean black, on;
  char keyboard;

  // Constructor
  PianoKey(int x, int y, String note, char keyboard, boolean black) {
    this.x = x;
    this.y = y;
    if (!black) {
      w=150;
      h=400;
      c1 = 255;
      c2 = 180;
    } else {
      w=100;
      h=300;
      c1=140;
      c2=100;
    }
    this.note = note;
    on=false;
    this.black = black;
    this.keyboard = keyboard;
  }
  // Member methods
  void display() {
    rectMode(CENTER);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    text(note, x, 9*y/5);
    text(keyboard, x, 10*y/6);
  }
  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      if (black) {
        on = true;
        return on;
      } else {
        if (blackPressed == true) {
          on = false;
          return on;
        } else {
          on = true;
          return on;
        }
      }
    } else {
      on = false;
      return on;
    }
  }
}
