//1. Show player animation
//2. keyPressed variable
//3. make bg an image
String[] froggyGoesUp = {"spr_frog_up_0.png", "spr_frog_up_1.png", 
  "spr_frog_up_2.png", "spr_frog_up_3.png", "spr_frog_up_4.png"};
String[] froggyGoesLeft = {"spr_frog_left_0.png", "spr_frog_left_1.png", 
  "spr_frog_left_2.png", "spr_frog_left_3.png", "spr_frog_left_4.png"};
String[] froggyGoesDown = {"spr_frog_down_0.png", "spr_frog_down_1.png", 
  "spr_frog_down_2.png", "spr_frog_down_3.png", "spr_frog_down_4.png"};
String[] froggyGoesRight = {"spr_frog_right_0.png", "spr_frog_right_1.png", 
  "spr_frog_right_2.png", "spr_frog_right_3.png", "spr_frog_right_4.png"};

PImage mainPageImage;
PImage carLeft1;
PImage carLeft2;
PImage carLeft3;
PImage carRight1;
PImage carRight2;

PImage log1;
PImage log2;
PImage log3;
PImage log4;
PImage log5;
PImage bg;
PImage froggy;
PImage truckLeft1;
PImage truckRight1;
PImage truckLeft2;
PImage truckRight2;
PImage deadFrog;

boolean mainPage = true;

int log1XAxis = -190;
int log1YAxis = 70;
int log2XAxis = 540;
int log2YAxis = 40;
int log3XAxis = 104;
int log3YAxis = 200;
int log4XAxis = 1100;
int log4YAxis = 260;
int log5XAxis = 700;
int log5YAxis = 160;
int froggyXAxis = 650;
int froggyYAxis = 720;
int froggyAnimationIndex = 0;
int truckLeft1XAxis = 300;
int truckLeft1YAxis = 640;
int truckLeft2XAxis = 900;
int truckLeft2YAxis = 640;
int truckRight1XAxis = 100;
int truckRight1YAxis = 420;
int truckRight2XAxis = 700;
int truckRight2YAxis = 420;
int carLeft1XAxis = -40;
int carLeft1YAxis = 570;
int carLeft2XAxis = 200;
int carLeft2YAxis = 570;
int carLeft3XAxis = 500;
int carLeft3YAxis = 570;
int carRight1XAxis = -50;
int carRight1YAxis = 500;
int carRight2XAxis = 300;
int carRight2YAxis = 500;

void setup() {
  size(1364, 768);
  frameRate(20);
  deadFrog = loadImage("spr_death_0.png");
  mainPageImage = loadImage("main-page.jpg");
  carLeft1 = loadImage("spr_car_left_0.png");
  carLeft2 = loadImage("spr_car_left_0.png");
  carLeft3 = loadImage("spr_car_left_0.png");
  carRight1 = loadImage("spr_car_right_0.png");
  carRight2 = loadImage("spr_car_right_0.png");
  log1 = loadImage("spr_log_0.png");
  log2 = loadImage("spr_log_0.png");
  log3 = loadImage("spr_log_0.png");
  log4 = loadImage("spr_log_0.png");
  log5 = loadImage("spr_log_0.png");
  truckRight1 = loadImage("spr_truck_right_0.png");
  truckLeft1 = loadImage("spr_truck_left_0.png");
  truckRight2 = loadImage("spr_truck_right_0.png");
  truckLeft2 = loadImage("spr_truck_left_0.png");
  froggy = loadImage(froggyGoesUp[0]);
  bg = loadImage("frogger-background.jpg");
}

void draw() {

  if (mainPage == true) {
    background(mainPageImage);
  } else {
    background(bg);
    move();
    animateTrucks();
    animateLogs();
    animateCars();
    didWin();
    didLose();
      if (didLose() == true) {
    textSize(95);
    fill(255, 0, 0);
    text("YOU LOSE", 450, 400);
  }
  }
}

void move() {
  image(froggy, froggyXAxis, froggyYAxis);
  if (keyPressed == true && didLose() == false && didWin() == false) {
    if (key == 'w' || key == 'W') {
      froggyYAxis = froggyYAxis - 5;
      
      froggy = loadImage(froggyGoesUp[froggyAnimationIndex]);

      froggyAnimationIndex = froggyAnimationIndex + 1;

      if (froggyAnimationIndex > 4) {
        froggyAnimationIndex = 0;
      }
      
    }
    if (key == 'a' && froggyXAxis > 0 || key == 'A' && froggyXAxis > 0) {
      froggyXAxis = froggyXAxis - 5;
      froggy = loadImage(froggyGoesLeft[froggyAnimationIndex]);
      froggyAnimationIndex = froggyAnimationIndex + 1;

      if (froggyAnimationIndex > 4) {
        froggyAnimationIndex = 0;
      }
      }
    if (key == 's' && froggyYAxis < 730 || key == 'S' && froggyYAxis < 730) {
      froggyYAxis = froggyYAxis + 5;
      froggy = loadImage(froggyGoesDown[froggyAnimationIndex]);

      froggyAnimationIndex = froggyAnimationIndex + 1;

      if (froggyAnimationIndex > 4) {
        froggyAnimationIndex = 0;
      }
    }
    if (key == 'd' && froggyXAxis < 1310 || key == 'D' && froggyXAxis < 1310) {
      froggyXAxis = froggyXAxis + 5;
      froggy = loadImage(froggyGoesRight[froggyAnimationIndex]);

      froggyAnimationIndex = froggyAnimationIndex + 1;

      if (froggyAnimationIndex > 4) {
        froggyAnimationIndex = 0;
      }
    }
  }
}
void animateCars() {
  image(carLeft1, carLeft1XAxis, carLeft1YAxis);
  if (didWin() == false && didLose() == false) {
    carLeft1XAxis = carLeft1XAxis - 9;
    if (carLeft1XAxis < -148) {
      carLeft1XAxis = 1440;
    }
  }
  image(carLeft2, carLeft2XAxis, carLeft2YAxis);
  if (didWin() == false && didLose() == false) {
    carLeft2XAxis = carLeft2XAxis - 9;
    if (carLeft2XAxis < -148) {
      carLeft2XAxis = 1440;
    }
  }
  image(carLeft3, carLeft3XAxis, carLeft3YAxis);
  if (didWin() == false && didLose() == false) {
    carLeft3XAxis = carLeft3XAxis - 9;
    if (carLeft3XAxis < -148) {
      carLeft3XAxis = 1440;
    }
  }
  image(carRight1, carRight1XAxis, carRight1YAxis);
  if (didWin() == false && didLose() == false) {
    carRight1XAxis = carRight1XAxis + 9;
    if (carRight1XAxis > 1440) {
      carRight1XAxis = -148;
    }
  }
  image(carRight2, carRight2XAxis, carRight2YAxis);
  if (didWin() == false && didLose() == false) {
    carRight2XAxis = carRight2XAxis + 9;
    if (carRight2XAxis > 1440) {
      carRight2XAxis = -148;
    }
  }
}
void animateTrucks() {
  image(truckLeft1, truckLeft1XAxis, truckLeft1YAxis);
  if (didWin() == false && didLose() == false) {
    truckLeft1XAxis = truckLeft1XAxis - 6;
    if (truckLeft1XAxis < -148) {
      truckLeft1XAxis = 1440;
    }
  }

  image(truckRight1, truckRight1XAxis, truckRight1YAxis);
  if (didWin() == false && didLose() == false) {
    truckRight1XAxis = truckRight1XAxis + 6;
    if (truckRight1XAxis > 1440) {
      truckRight1XAxis = -140;
    }
  }
  image(truckLeft2, truckLeft2XAxis, truckLeft2YAxis);
  if (didWin() == false && didLose() == false) {
    truckLeft2XAxis = truckLeft2XAxis - 6;
    if (truckLeft2XAxis < -148) {
      truckLeft2XAxis = 1440;
    }
  }
  image(truckRight2, truckRight2XAxis, truckRight2YAxis);
  if (didWin() == false && didLose() == false) {
    truckRight2XAxis = truckRight2XAxis + 6;
    if (truckRight2XAxis > 1440) {
      truckRight2XAxis = -140;
    }
  }
}

void animateLogs() {
  image(log1, log1XAxis, log1YAxis);
  if (didWin() == false && didLose() == false) {
    log1XAxis = log1XAxis + 5;
    if (log1XAxis > 1364) {
      log1XAxis = -330;
    }
  }
  image(log2, log2XAxis, log2YAxis);
  if (didWin() == false && didLose() == false) {
    log2XAxis = log2XAxis + 5;
    if (log2XAxis > 1364) {
      log2XAxis = -330;
    }
  }
  image(log3, log3XAxis, log3YAxis);
  if (didWin() == false && didLose() == false) {
    log3XAxis = log3XAxis + 5;
    if (log3XAxis > 1364) {
      log3XAxis = -330;
    }
  }
  image(log4, log4XAxis, log4YAxis);
  if (didWin() == false && didLose() == false) {
    log4XAxis = log4XAxis + 5;
    if (log4XAxis > 1364) {
      log4XAxis = -330;
    }
  }
  image(log5, log5XAxis, log5YAxis);
  if (didWin() == false && didLose() == false) {
    log5XAxis = log5XAxis + 5;
    if (log5XAxis > 1364) {
      log5XAxis = -330;
    }
  }
}
boolean didWin() {
  if (froggyYAxis < -5) {
    textSize(82);
    text("YOU WIN!!", 450, 400);
    fill(255, 128, 0);
    return true;
  } else {
    return false;
  }
}


boolean didLose() {
  //truckLeft1
  if (checkCollision(truckLeft1XAxis, truckLeft1YAxis, 154, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//truckLeft2
  else if  (checkCollision(truckLeft2XAxis, truckLeft2YAxis, 154, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//truckRight1
  else if  (checkCollision(truckRight1XAxis, truckRight1YAxis, 154, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//truckRight2
  else if (checkCollision(truckRight2XAxis, truckRight2YAxis, 154, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//carLeft1
  else if (checkCollision(carLeft1XAxis, carLeft1YAxis, 114, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//carLeft2
  else if (checkCollision(carLeft2XAxis, carLeft2YAxis, 114, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//carLeft3
  else if (checkCollision(carLeft3XAxis, carLeft3YAxis, 114, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//carRight1
  else if (checkCollision(carRight1XAxis, carRight1YAxis, 114, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//carRight2
  else if (checkCollision(carRight2XAxis, carRight2YAxis, 114, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//log1
  else if (checkCollision(log1XAxis, log1YAxis, 320, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//log2
  else if (checkCollision(log2XAxis, log2YAxis, 320, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//log3
  else if (checkCollision(log3XAxis, log3YAxis, 320, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//log4
  else if (checkCollision(log4XAxis, log4YAxis, 320, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  }//log5
  else if (checkCollision(log5XAxis, log5YAxis, 320, 64, froggyXAxis, froggyYAxis, 42, 60) == true) {
    froggy = deadFrog;
    return true;
  } else {
    return false;
  }
}

boolean checkCollision(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

  // are the sides of one rectangle touching the other?

  if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
    r1x <= r2x + r2w &&    // r1 left edge past r2 right
    r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
    r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
    return true;
  }
  return false;
}
void mousePressed() {
  if (mouseX > 437 && mouseX < 837 && mouseY > 583 && mouseY < 701 && mainPage == true) {
    mainPage = false;
  }
}
