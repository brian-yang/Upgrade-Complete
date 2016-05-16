ArrayList<Button> activeButtons = new ArrayList<Button>(); // list of active buttons

// Functions that customize each screen

void welcome() {
  screenButtons.get(0)
    .show()
    .setId(0)
    .setPosition(200, 250)
    .setSize(100, 100)
    .getCaptionLabel().setText("Start!");
  activeButtons.add(screenButtons.get(0));
 
}

void store() {
  screenButtons.get(2)
    .show()
    .setId(1)
    .setPosition(200, 250)
    .setSize(100, 100)
    .getCaptionLabel().setText("Menu");
  activeButtons.add(screenButtons.get(2));
}
void menu() {
  screenButtons.get(1)
    .show()
    .setId(1)
    .setPosition(200, 250)
    .setSize(100, 100)
    .getCaptionLabel().setText("Play");
    
  screenButtons.get(3)
    .show()
    .setId(1)
    .setPosition(200, 550)
    .setSize(100, 100)
    .getCaptionLabel().setText("Store");
    
  activeButtons.add(screenButtons.get(1));
  activeButtons.add(screenButtons.get(3));
}
void play() {
  background(0, 102, 204);
  if (game.isFinished()) {
    background(0);
    screenButtons.get(2)
      .show()
      .setId(1)
      .setPosition(200, 250)
      .setSize(100, 100)
      .getCaptionLabel().setText("Menu");
    activeButtons.add(screenButtons.get(2));
  } else {
    game.run();
  }
}