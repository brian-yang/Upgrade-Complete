class Screen {
    String name;
    
    Screen(String screenName) {
      name = screenName;
    }
    
    void display() {
        if (name.equals("Welcome")) {
          welcome();
        } else if (name.equals("Store")) {
          store();
        } else if (name.equals("Menu")) {
          menu();
        } else {
          play();
        }

        for (Button b : activeButtons) {
          b.show();
        }

    }
    
}