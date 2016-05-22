void backgroundGen() {
  int bgLevel = upgrades.get("Background");
  if (bgLevel == 1) {
    background(255);
  } else if (bgLevel == 2) {
    background(32, 75, 100);
  }
}