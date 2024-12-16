// Henry Baldwin | Temp Converter | 23 Sept 2024
float farToCel;

void setup() {
  size(600, 200);
}
// Display your name and app title
void draw() {
  background(128);

  textSize(25);
  textAlign(CENTER);
  fill(0);
  text("Temp Converter", width/2, height/4-25);
  textSize(10);
  text("Made By Henry Baldwin", width/2, height/4-10);

  textSize(15);
  line(0, 150, width, 150);
  for (int i=0; i<width; i=i+50) {
    line(i, 145, i, 155);
    text(i-300, i, 165);
  }
  text("Far:" + (mouseX-300) + " | Cel: " + farToCel(mouseX-300), width/2, height/2);
  text("Cel:" + (mouseX-300) + " | Far: " + celToFar(mouseX-300), width/2, height/2+15);

  // Add far info
  // change number line to display -200 -> 200
  println("MouseX:" + mouseX + ":" + farToCel(mouseX));
  println("MouseX:" + mouseX + ":" + celToFar(mouseX));
}

Float farToCel(float tempFar) {
  // formula to calc cel conv
  tempFar = (tempFar-32) * 5/9;
  return tempFar;
}

float celToFar(float tempCel) {
  // include correct formula
  tempCel = (tempCel * 9/5) + 32;
  return tempCel;
}
