ArrayList<Button> screenButtons = new ArrayList<Button>(); // list of buttons related to screen changing
ArrayList<Button> upgradeButtons = new ArrayList<Button>(); // list of buttons related to upgrades

// NOTE: All buttons should be hidden when initialized

void screenButtons() {
  screenButtons.add(controlP5.addButton("Start!")); // 0
  screenButtons.add(controlP5.addButton("Play")); // 1
  screenButtons.add(controlP5.addButton("Menu")); // 2
  screenButtons.add(controlP5.addButton("Store")); // 3
  shapeScreenButtons();
}

void upgradeButtons() {}

void shapeScreenButtons() {
  for (Button b : screenButtons) {
    b.setSize(100, 100);
    b.setId(1);
    b.hide();
  }
}