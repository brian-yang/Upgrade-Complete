ArrayList<Button> screenButtons = new ArrayList<Button>(); // list of buttons related to screen changing
ArrayList<Button> upgradeButtons = new ArrayList<Button>(); // list of buttons related to upgrades
Map<String, Integer> upgradesLimit = new HashMap<String, Integer>(); // upgrades limit
Map<String, Integer> curUpgradeLevels = new HashMap<String, Integer>(); // upgrades and level of upgrades

// Buttons have IDs depending on what type they are
// Intro button(s): ID = 0
// Menu button(s): ID = 1
// Upgrade button(s): ID = 2
// Each screen button also has a corresponding value in order to switch
// between screens

void screenButtons() {
  screenButtons.add(controlP5.addButton("Start!")); // 0
  screenButtons.add(controlP5.addButton("Play")); // 1
  screenButtons.add(controlP5.addButton("Menu")); // 2
  screenButtons.add(controlP5.addButton("Store")); // 3
  screenButtons.add(controlP5.addButton("Intro")); //4
  shapeScreenButtons();
}

void upgradeButtons() {
  fileParse(upgradesLimit, "upgrades/upgrades.txt");
  startUpgrades();
  for (String s : upgradesLimit.keySet()) {
    String caption;
    if (s.contains(" ")) {
      caption = s.split(" ")[0] + "\n\n" + s.split(" ")[1];
    } else {
      caption = s;
    }
    upgradeButtons.add(
      controlP5.addButton(s)
        .setLabel(caption + "\n\nLevel: " + 1)
        .setStringValue(Integer.toString(upgradesLimit.get(s)))
        // Used setStringValue instead of setValue because
        // setValue gave a NoClassDefFound Error
    );
  }
  shapeUpgradeButtons();
  //System.out.println(upgradeButtons);
}

void startUpgrades() {
  for (String s : upgradesLimit.keySet()) {
    curUpgradeLevels.put(s, 1);
  }
}

void shapeScreenButtons() {
  for (Button b : screenButtons) {
    b.setSize(150, 100);
    b.setId(1);
    b.hide();
  }
}

void shapeUpgradeButtons() {
  for (Button b : upgradeButtons) {
    b.setSize(150, 100);
    b.setId(2);
    b.hide();
  }
}