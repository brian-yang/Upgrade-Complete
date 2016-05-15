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

void store() {}
void menu() {}
void play() {}