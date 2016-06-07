ArrayList<Button> activeButtons = new ArrayList<Button>(); // list of active buttons
boolean gameover = true;
boolean won = false;
// ======================================================
/* SCREEN CUSTOMIZER FUNCTIONS */
// ======================================================
void first() {
  screenButtons.get(4)
    .setPosition(200, 250)
    .setId(0)
    .setSize(100,100)
    .setLabel("Yes!");
  addActiveButtons(4);
}

void welcome() {
  screenButtons.get(0)
    .setPosition(200, 450)
    .setId(0)
    .setSize(100,100);
  addActiveButtons(0);
}

void store() {
  screenButtons.get(2).setPosition(200, 250);
  addActiveButtons(2);
  displayMoney();
  storeUpgrades();
}
void menu() {
  screenButtons.get(1).setPosition(200, 250);  
  screenButtons.get(3).setPosition(200, 550);

  addActiveButtons(1);
  addActiveButtons(3);
}


void play() {
  if (game.isFinished() && game.passEnemies.isEmpty() && gameover == false){
    song1.pause();
    won = true;
    
    System.out.println("received?");
    level += 1;
    endGame();
    screenButtons.get(2).setPosition(200, 250);
    addActiveButtons(2);
    screenButtons.get(1).setLabel("Level" + level);
    gameover = true;
  }
   if (game.isFinished()){
     song1.pause();
     electricity.pause();
     background(255);
     endGame();
    screenButtons.get(1).setLabel("Level" + level);
     screenButtons.get(2).setPosition(200, 250);
     addActiveButtons(2);
     gameover = true;
     if (won == false){
       textSize(32);
        fill(0);
        text("lost",500 ,500 );
   } else {
   
    textSize(100);
    fill(255, 204, 0);
    text("You Win!!!",400, 500);
   }
   }
  else {
    game.run();
    won = false;
  }
}

// ======================================================
/* HELPER FUNCTIONS */
// ======================================================

void addActiveButtons(int index) {
  if (!activeButtons.contains(screenButtons.get(index))) {
    activeButtons.add(screenButtons.get(index));
  }
}

void storeUpgrades() {
  float widthMultiplier = .05;
  float heightMultiplier = .7;
  float startWidth = widthMultiplier * width;
  float startHeight = heightMultiplier * height;
  
  // Upgrade button placement
  for (Button b : upgradeButtons) {
    if(!activeButtons.contains(b)) {
      b.setPosition(startWidth, startHeight);
      activeButtons.add(b);
      
      // Calculate button placement
      widthMultiplier += .15;
      //heightMultiplier += .1;  
      startWidth = widthMultiplier * width;
      startHeight = heightMultiplier * height;
    }
  }

}

void endGame() {
  if (gameMode == 1) {
    money += 50;
  }
   // forces money to be added once per game
  gameMode = 0;
}

void displayMoney() {
  textSize(50);
  text("Cash: $" + Integer.toString(money), .05 * width, .95 * height);
}