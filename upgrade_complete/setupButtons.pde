ArrayList<Button> screenButtons = new ArrayList<Button>(); // list of buttons related to screen changing
ArrayList<Button> upgradeButtons = new ArrayList<Button>(); // list of buttons related to upgrades
Map<String, Integer> upgrades = new HashMap<String, Integer>(); // upgrades and level of upgrades

void screenButtons() {
  screenButtons.add(controlP5.addButton("Start!")); // 0
  screenButtons.add(controlP5.addButton("Play")); // 1
  screenButtons.add(controlP5.addButton("Menu")); // 2
  screenButtons.add(controlP5.addButton("Store")); // 3
  shapeScreenButtons();
}

void upgradeButtons() {
  fileParse(upgrades, "upgrades/upgrades.txt");
  for (String s : upgrades.keySet()) {
    upgradeButtons.add(
      controlP5.addButton(s)
        .setLabel(s + "\n\nLevel: " + upgrades.get(s))
        .setStringValue(Integer.toString(upgrades.get(s)))
        // Used setStringValue instead of setValue because
        // setValue gave a NoClassDefFound Error
    );
  }
  shapeUpgradeButtons();
  //System.out.println(upgradeButtons);
}

void shapeScreenButtons() {
  for (Button b : screenButtons) {
    b.setSize(100, 100);
    b.setId(1);
    b.hide();
  }
}

void shapeUpgradeButtons() {
  for (Button b : upgradeButtons) {
    b.setSize(50, 100);
    b.setId(2);
    b.hide();
  }
}