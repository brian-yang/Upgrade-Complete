final float MAX_THETA = PI/10;

float minJumpLength = 1;
float maxJumpLength = 5;

int plusOrMinus() {
  return int(random(0, 2)) * 2 - 1;
}

class Lightning {
  float theta;
  float playerX, playerY;
  float lightningX, lightningY;
  float straightJump;
  int lightningCounter;

  Lightning(float playerX, float playerY){
    this.playerX = playerX;
    this.playerY = playerY;
    lightningX = playerX;
    lightningY = playerY;
    theta = 0;
    lightningCounter = 0;
  }

  void show(float xBound1, float yBound1, float xBound2, float yBound2, float angle) {
    while((lightningY >= yBound1 && lightningY <= yBound2) && 
          (lightningX >= xBound1 && lightningX <= xBound2)) {
      
      theta += plusOrMinus() * random(PI/15, PI/10);
      if (theta > MAX_THETA) {
        theta = MAX_THETA;
      } else if (theta < -MAX_THETA) {
        theta = -MAX_THETA;
      }
      
      straightJump = random(minJumpLength, maxJumpLength);
      
      lightningX = playerX - straightJump * cos(theta + angle);
      lightningY = playerY - straightJump * sin(theta + angle);
      
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