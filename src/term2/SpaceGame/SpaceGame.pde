// Henry Baldwin | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laserSound;
Spaceship fred;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> pwrps = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();


int score, level, levelMult;
boolean play, start;
Timer puTime;
Timer rTime;
PImage gOvr;

void setup() {
  size(800, 800);
  background(0);
  frameRate(120);
  levelMult=1;
  fred = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  start = true;
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(800);
  puTime.start();
  gOvr = loadImage("SpaceOver1.png");
  laserSound = new SoundFile(this, "laser.wav");
}

void draw() {
  if (!play && start) {
    startScreen();
  } else if (play && !start) {
    if (frameCount % 1000 == 0) {
      levelUp();
    }

    background(0);
    noCursor();
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
      }
    }


    //Render powerups
    if (puTime.isFinished()) {
      pwrps.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i <pwrps.size(); i++) {
      Powerup pu = pwrps.get(i);
      if (pu.intersect(fred)) {
        // 1. Remove Powerup
        pwrps.remove(i);
        if (pu.type == 'a') {
          if (fred.turretCount<5) {
            fred.turretCount+=1;
          } else {
            rocks.clear();
            score+=50;
          }
        }
        if (pu.type == 'b') {
          fred.health+=50;
        }
        if (pu.type == 'c') {
          fred.laserCount+= 100;
        }
      }

      // 2. Health
      // 3. Laser Strength
      // 4. More Ammo
      // 5. Turret Count
      // 6. Heat Seaking
      // 7. Time Credit
      // 8. Remove All Enemy Objects on Screen
      // 9. Temp Score Multiplier
      // 10. Alter Enemy Object Speed
      // 11. Rotating Rocks for Mele Damage
      // 12. Temp Invincibility
      pu.display();
      pu.move();
    }



    // lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.move();
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          lasers.remove(i);
          if (r.type != 'c') {
            if (r.type == 'a') {
              if (r.diam>300);
              {
                r.diam-=r.diam/10;
              }
            } else if (r.type == 'b') {
              if (r.diam>300);
              {
                r.diam-=r.diam/10;
              }
            }
            r.health-=50;
            // if type = c
          } else {
          }
          if (r.diam<=0) {
            r.health=0;
          }
        }
      }
      if (laser.reachedTop()) {
        // code OCCASIONALLY crashes right here :(
        lasers.remove(i);
      }
    }


    // rocks
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (fred.intersect(rock)) {
        fred.health-=10;
        score+=1;
        rock.health-=99999999;
      }
      if (rock.reachedBottom()) {
        rocks.remove(i);
      }

      if (rock.health<=0) {
        rocks.remove(i);
        if (rock.type == 'a') {
          score+=3;
        } else if (rock.type=='b') {
          score+=1;
        } else if (rock.type=='c') {
          score+=5;
        }
      }
    }

    fred.display();
    fred.move(mouseX, mouseY);
    if (fred.health<=0) {
      gameOver();
    }
    infoPanel();
  } else {
    if (mousePressed) {
      newGame();
    }
  }
}



void infoPanel() {
  textAlign(CORNER);
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  text("Score:" + score, 20, 36);
  text("Health:" + fred.health, 160, 36);
  text("Level:" + level, 350, 36);
  text("Ammo:" + fred.laserCount, 500, 36);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("SpaceGame", width/2, height/2);
  text("Made by: Henry Baldwin", width/2, height/2-100);
  text("Please click anywhere to start!", width/2, height/2-50);
  cursor(HAND);
}

void gameOver() {
  image(gOvr, width/2, height/2);
  textAlign(CENTER);
  fill(210);
  text("Click anywhere to retry!", width/2, height/2-60);
  cursor(HAND);
  play = false;
}

void keyPressed() {
  if (key == ' ') {
    laserSound.play();
    if (fred.fire() && fred.turretCount == 1) {
      lasers.add(new Laser(fred.x, fred.y));
      fred.laserCount--;
    } else if (fred.fire() && fred.turretCount == 2) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      fred.laserCount-=2;
    } else if (fred.fire() && fred.turretCount == 3) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      fred.laserCount-=3;
    } else if (fred.fire() && fred.turretCount == 4) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      lasers.add(new Laser(fred.x+20, fred.y));
      fred.laserCount-=4;
    } else if (fred.fire() && fred.turretCount == 5) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      lasers.add(new Laser(fred.x+20, fred.y));
      lasers.add(new Laser(fred.x-20, fred.y));
      fred.laserCount-=5;
    }
  }
}

void mousePressed() {
  if (play) {
    laserSound.play();
    if (fred.fire() && fred.turretCount == 1) {
      lasers.add(new Laser(fred.x, fred.y));
      fred.laserCount--;
    } else if (fred.fire() && fred.turretCount == 2) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      fred.laserCount-=2;
    } else if (fred.fire() && fred.turretCount == 3) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      fred.laserCount-=3;
    } else if (fred.fire() && fred.turretCount == 4) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      lasers.add(new Laser(fred.x+20, fred.y));
      fred.laserCount-=4;
    } else if (fred.fire() && fred.turretCount == 5) {
      lasers.add(new Laser(fred.x, fred.y));
      lasers.add(new Laser(fred.x-40, fred.y));
      lasers.add(new Laser(fred.x+40, fred.y));
      lasers.add(new Laser(fred.x+20, fred.y));
      lasers.add(new Laser(fred.x-20, fred.y));
      fred.laserCount-=5;
    }
  } else if (start) {
    play = true;
    start = false;
  }
}
void newGame() {
  play = true;
  fred.x = width/2;
  fred.y = height/2;
  fred.w = 100;
  fred.laserCount = 1000;
  fred.turretCount = 1;
  fred.health = 100;
  score=0;
  level=1;
  rocks.clear();
  levelMult=1;
  rTime.totalTime=1000;
  pwrps.clear();
}

void levelUp() {
  level+=1;
  levelMult*=2;
  if (fred.laserCount<900) {
    fred.laserCount=900;
  }
  rTime.totalTime-=levelMult*5;
}
