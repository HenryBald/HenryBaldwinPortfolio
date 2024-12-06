// Henry Baldwin | 2 Dec 2024 | Music App
import processing.sound.*;
SoundFile middleC, Db4, D4, Eb4, E4, F4, Gb4, G4, Ab4, A4, Bb4, B4;
PianoKey[] pianokeys = new PianoKey[15];

String notePlayed;
boolean blackPressed;

void setup() {
  background(0);
  size(1500, 500);

  notePlayed="none";

  //white keys
  pianokeys[0] = new PianoKey(75, 200, "C4", 'a', false);
  pianokeys[1] = new PianoKey(75+150*1, 200, "D4", 's', false);
  pianokeys[2] = new PianoKey(75+150*2, 200, "E4", 'd', false);
  pianokeys[3] = new PianoKey(75+150*3, 200, "F4", 'f', false);
  pianokeys[4] = new PianoKey(75+150*4, 200, "G4", 'g', false);
  pianokeys[5] = new PianoKey(75+150*5, 200, "A4", 'h', false);
  pianokeys[6] = new PianoKey(75+150*6, 200, "B4", 'j', false);
  pianokeys[7] = new PianoKey(75+150*7, 200, "C5", 'k', false);
  pianokeys[8] = new PianoKey(75+150*8, 200, "D5", 'l', false);
  pianokeys[9] = new PianoKey(75+150*9, 200, "E5", ';', false);
  //black keys
  pianokeys[10] = new PianoKey(150, 150, "Db4", 'w', true);
  pianokeys[11] = new PianoKey(150+150, 150, "Eb4", 'e', true);
  pianokeys[12] = new PianoKey(150+150*3, 150, "Gb4", 't', true);
  pianokeys[13] = new PianoKey(150+150*4, 150, "Ab4", 'y', true);
  pianokeys[14] = new PianoKey(150+150*5, 150, "Bb4", 'u', true);


  middleC = new SoundFile(this, "middleC.wav");
  Db4 = new SoundFile(this, "DbCSharp.wav");
  D4 = new SoundFile(this, "D.wav");
  Eb4 = new SoundFile(this, "EbDSharp.wav");
  E4 = new SoundFile(this, "E.wav");
  F4 = new SoundFile(this, "F.wav");
  Gb4 = new SoundFile(this, "GbFSharp.wav");
  G4 = new SoundFile(this, "G.wav");
  Ab4 = new SoundFile(this, "AbGSharp.wav");
  A4 = new SoundFile(this, "A.wav");
  Bb4 = new SoundFile(this, "BbASharp.wav");
  B4 = new SoundFile(this, "B.wav");
}

void draw() {
  background(0);
  for (int i=0; i<pianokeys.length; i++) {
    pianokeys[i].hover(mouseX, mouseY);
    pianokeys[i].display();
  }
  for (int j=0; j<pianokeys.length; j++) {
    if (blackPressed==true) {
      if (!pianokeys[j].black && pianokeys[j].on) {
        blackPressed=false;
      }
      if (pianokeys[j].black && pianokeys[j].on) {
        blackPressed=true;
      }
    }
  }
}


void mousePressed() {
  for (int i=0; i<pianokeys.length; i++) {
    if (pianokeys[i].on) {
      notePlayed = pianokeys[i].note;
      println("note:" + notePlayed);
      playNote();
    }
  }
}
void playNote() {
  if (notePlayed == "C4") {
    middleC.play();
  } else if (notePlayed == "Db4") {
    Db4.play();
  } else if (notePlayed == "D4") {
    D4.play();
  } else if (notePlayed == "Eb4") {
    Eb4.play();
  } else if (notePlayed == "E4") {
    E4.play();
  } else if (notePlayed == "F4") {
    F4.play();
  } else if (notePlayed == "Gb4") {
    Gb4.play();
  } else if (notePlayed == "G4") {
    G4.play();
  } else if (notePlayed == "Ab4") {
    Ab4.play();
  } else if (notePlayed == "A4") {
    A4.play();
  } else if (notePlayed == "Bb4") {
    Bb4.play();
  } else if (notePlayed == "B4") {
    B4.play();
  }
  notePlayed = "none";
}

void keyPressed() {
  if (key=='a') {
    notePlayed="C4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='s') {
    notePlayed="D4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='d') {
    notePlayed="E4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='f') {
    notePlayed="F4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='g') {
    notePlayed="G4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='h') {
    notePlayed="A4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='j') {
    notePlayed="B4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='w') {
    notePlayed="Db4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='e') {
    notePlayed="Eb4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='t') {
    notePlayed="Gb4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='y') {
    notePlayed="Ab4";
    println("note:" + notePlayed);
    playNote();
  } else if (key=='u') {
    notePlayed="Bb4";
    println("note:" + notePlayed);
    playNote();
  }
}
