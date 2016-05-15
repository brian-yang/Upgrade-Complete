ArrayList<Button> screenButtons = new ArrayList<Button>(); // list of buttons related to screen changing
ArrayList<Button> upgradeButtons = new ArrayList<Button>(); // list of buttons related to upgrades

// NOTE: All buttons should be hidden when initialized

void screenButtons() {
  screenButtons.add(controlP5.addButton("Start!").hide());
  screenButtons.add(controlP5.addButton("Play").hide());
  screenButtons.add(controlP5.addButton("Menu").hide());
  screenButtons.add(controlP5.addButton("Store").hide());
}

void upgradeButtons() {}