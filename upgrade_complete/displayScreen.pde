ArrayList<Button> activeButtons = new ArrayList<Button>(); // list of active buttons

// SCREEN CUSTOMIZER FUNCTIONS

void welcome() {
  screenButtons.get(0)
    .setPosition(200, 250)
    .setId(0);
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
  background(0, 102, 204);
  if (game.isFinished()) {
    background(0);
    endGame();
    screenButtons.get(2).setPosition(200, 250);
    addActiveButtons(2);
  } else {
    game.run();
  }
}

// HELPER FUNCTIONS
void addActiveButtons(int index) {
  if (!activeButtons.contains(screenButtons.get(index))) {
    activeButtons.add(screenButtons.get(index));
  }
}

void storeUpgrades() {
  for (Button b : upgradeButtons) {
    if(!activeButtons.contains(b)) {
      b.setPosition(.75 * width, .75 * height);
      activeButtons.add(b);
    }
  }
}

void endGame() {
  if (gameMode == 1) {
    money += 50;
  } // forces money to be added once
  gameMode = 0;
}

void displayMoney() {
  textSize(50);
  text("Cash: $" + Integer.toString(money), .05 * width, .95 * height);
}