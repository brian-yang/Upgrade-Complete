final float MAX_ANGLE = PI/10;
final float MIN_BRANCH_LENGTH = 1;
final float MAX_BRANCH_LENGTH = 5;

int plusOrMinus() {
  return int(random(0, 2)) * 2 - 1;
}

class Lightning {
  float angle;
  float playerX, playerY;
  float lightningX, lightningY;
  float branchLength;
  int lightningCounter;

  Lightning(float playerX, float playerY){
    this.playerX = playerX;
    this.playerY = playerY;
    lightningX = playerX;
    lightningY = playerY;
    angle = 0;
    lightningCounter = 0;
  }

  void show(float xBound1, float yBound1, float xBound2, float yBound2, float offsetAngle) {
    while((lightningY >= yBound1 && lightningY <= yBound2) && 
          (lightningX >= xBound1 && lightningX <= xBound2)) {
      
      angle += plusOrMinus() * random(PI/15, PI/10);
      if (angle > MAX_ANGLE) {
        angle = MAX_ANGLE;
      } else if (angle < -MAX_ANGLE) {
        angle = -MAX_ANGLE;
      }
      
      branchLength = random(MIN_BRANCH_LENGTH, MAX_BRANCH_LENGTH);
      
      lightningX = playerX - branchLength * cos(angle + offsetAngle);
      lightningY = playerY - branchLength * sin(angle + offsetAngle);
      
      pushStyle();
      
      strokeWeight(5);
      stroke(235, 240, 119);
      line(playerX, playerY, lightningX, lightningY);
      
      popStyle();

      playerX = lightningX;
      playerY = lightningY;
     
      lightningCounter++;
    }
  }
  
  void reset(float x, float y) {
    playerX = x;
    lightningX = x;
    playerY = y;
    lightningY = y;
    lightningCounter = 0;
  }
  
  int getCounter() {
    return lightningCounter;
  }
}