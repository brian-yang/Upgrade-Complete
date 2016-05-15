ArrayList<Button> screenButtons = new ArrayList<Button>(); // list of buttons related to screen changing
ArrayList<Button> upgradeButtons = new ArrayList<Button>(); // list of buttons related to upgrades

// NOTE: All buttons should be hidden when initialized

void screenButtons() {
  screenButtons.add(controlP5.addButton("Start!").hide()); // 0
  screenButtons.add(controlP5.addButton("Play").hide()); // 1
  screenButtons.add(controlP5.addButton("Menu").hide()); // 2
  screenButtons.add(controlP5.addButton("Store").hide()); // 3
}

void upgradeButtons() {}