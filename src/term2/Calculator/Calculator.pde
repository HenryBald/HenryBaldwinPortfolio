// Henry Baldwin | Calculator App | 30 Sept 24

Button[] buttons = new Button[24];
String dVal = "0";
float l, r, result;
char op;
int rb;
boolean left;


void setup() {
  size(420, 520);
  background(#393A3B);
  l = 0.0;
  r = 0.0;
  op = ' ';
  left = true;
  rb = int(random(0, 24));

  buttons[0] = new Button(50, 470, "0", 60, 60, true, false);
  buttons[1] = new Button(50, 470-4*20, "1", 60, 60, true, false);
  buttons[2] = new Button(50, 470-8*20, "4", 60, 60, true, false);
  buttons[3] = new Button(50, 470-12*20, "7", 60, 60, true, false);
  buttons[4] = new Button(50, 470-16*20, "C", 60, 60, false, false);
  buttons[5] = new Button(50+4*20, 470, ".", 60, 60, false, false);
  buttons[6] = new Button(50+4*20, 470-4*20, "2", 60, 60, true, false);
  buttons[7] = new Button(50+4*20, 470-8*20, "5", 60, 60, true, false);
  buttons[8] = new Button(50+4*20, 470-12*20, "8", 60, 60, true, false);
  buttons[9] = new Button(50+4*20, 470-16*20, "±", 60, 60, false, false);
  buttons[10] = new Button(50+4*40, 470, "x!", 60, 60, false, false);
  buttons[11] = new Button(50+4*40, 470-4*20, "3", 60, 60, true, false);
  buttons[12] = new Button(50+4*40, 470-8*20, "6", 60, 60, true, false);
  buttons[13] = new Button(50+4*40, 470-12*20, "9", 60, 60, true, false);
  buttons[14] = new Button(50+4*40, 470-16*20, "xʸ", 60, 60, false, false);
  buttons[15] = new Button(50+4*60, 470, "+", 60, 60, false, false);
  buttons[16] = new Button(50+4*60, 470-4*20, "-", 60, 60, false, false);
  buttons[17] = new Button(50+4*60, 470-8*20, "÷", 60, 60, false, false);
  buttons[18] = new Button(50+4*60, 470-12*20, "x", 60, 60, false, false);
  buttons[19] = new Button(50+4*60, 470-16*20, "²√", 60, 60, false, false);
  buttons[20] = new Button(50+4*80, 470-40, "=", 60, 140, false, false);
  buttons[21] = new Button(50+4*80, 470-8*20, "π", 60, 60, false, false);
  buttons[22] = new Button(50+4*80, 470-12*20, "e", 60, 60, false, false);
  buttons[23] = new Button(50+4*80, 470-16*20, "ND", 60, 60, false, true);
}

void draw() {
  background(#393A3B);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}


void updateDisplay() {
  fill(200);
  rectMode(CORNER);
  rect(20, 20, 380, 80);
  fill(0);
  if (dVal.length()<15) {
    textSize(40);
  } else if (dVal.length() == 15) {
    textSize(39);
  } else if (dVal.length() == 16) {
    textSize(38);
  } else if (dVal.length() == 17) {
    textSize(37);
  } else if (dVal.length() == 18) {
    textSize(36);
  } else if (dVal.length() == 19) {
    textSize(35);
  } else if (dVal.length() == 20) {
    textSize(34);
  }
  textAlign(RIGHT);
  text(dVal, width-55, 70);
}

void mousePressed() {
  //println("Left:" + l + "   Right:" + r + "   Result:" + result + "   Operator:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20 && buttons[i].n == false) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left  && buttons[i].n == false) {
      dVal += buttons[i].val;
      r = float(dVal);
    }
    if (buttons[i].on == false && dVal.equals("0.0")) {
      dVal += buttons[i].val;
    } else if (buttons[i].on && buttons[i].n) {
      nerdInfect();
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("xʸ")) {
      op = '^';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left) {
        l = -l;
        dVal = str(l);
      } else {
        r = -r;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      if (left) {
        dVal += PI;
        l = PI;
      } else {
        dVal += PI;
        r = PI;
      }
    } else if (buttons[i].on && buttons[i].val.equals("e")) {
      if (left) {
        dVal += exp(1);
        l = exp(1);
      } else {
        dVal += exp(1);
        r = exp(1);
      }
    } else if (buttons[i].on && buttons[i].val.equals("²√")) {
      if (left) {
        l =  sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalculation();
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains("."))
        dVal += buttons[i].val;
    } else if (buttons[i].on && buttons[i].val.equals("x!")) {
      if (left) {
        l =  factorial(int(l));
        dVal = str(l);
      } else {
        r = factorial(int(r));
        dVal = str(r);
      }
    }
  }
}



void performCalculation() {
  // what do i do?
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '/') {
    result = l/r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = nf(result);
  l = result;
  r = 0;
  left = true;
}
void nerdInfect () {
  if (!buttons[0].n || !buttons[1].n || !buttons[2].n || !buttons[3].n || !buttons[4].n || !buttons[5].n || !buttons[6].n || !buttons[7].n || !buttons[8].n || !buttons[9].n || !buttons[10].n || !buttons[11].n || !buttons[12].n || !buttons[13].n || !buttons[14].n || !buttons[15].n || !buttons[16].n || !buttons[17].n || !buttons[18].n || !buttons[19].n || !buttons[20].n || !buttons[21].n || !buttons[22].n) {
    rb = int(random(0, 24));
    if (buttons[rb].n == true) {

      nerdInfect();
    } else {
      buttons[rb].n = true;
    }
  } else {
  }
}
void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '=' || keyCode == 61 || keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = '/';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = 'x';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("=") && !isNum) {
    performCalculation();
  }
}

int factorial(int n) {
  int res = 1, i;
  for (i = 2; i <= n; i++)
    res *= i;
  return res;
}
