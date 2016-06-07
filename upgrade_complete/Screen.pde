class Screen {
    String name;
    Screen(String screenName) {
      name = screenName;
    }
    
    void display() {
      if (name.equals("Welcome")) {
         if (timeElapsed > 2000 ){
            fill(0);
            String welcome = "The aim of the game is to upgrade... EVERYTHING! You have to upgrade everything to truly win.";
            textSize(12);
            text(welcome, 200, 150, 300, 300);  // Text wraps within text box 
            if (timeElapsed > 3000){             
              String store = "Are you ready to start?";
              textSize(16);
              text(store, 200, 250, 300, 300);
              first();
            }  // Text wraps within text box
            if (introPassed){ 
              String buyMenu = "Ok, here is $500. Have fun!";
              text(buyMenu, 200, 500, 300, 300);
              welcome();
            }
         }
           
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