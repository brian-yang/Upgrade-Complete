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
            text(welcome,200, 100, 300, 300);  // Text wraps within text box 
            if (timeElapsed > 4000){
              String store = "But if you want to buy something, you're gonna need a shop first. Would you like to buy a shop menu for $500?";
              textSize(16);
              text(store,200, 150, 300, 300);}  // Text wraps within text box
            if (timeElapsed > 6000 && timeElapsed <= 6050){ 
               controlP5.addButton("Yes1")
                .setPosition(200, 250)
                .setSize(64, 32);
                       
           }
         }
      }
            
            //welcome();
         else if (name.equals("Store")) {
          store();
        } else if (name.equals("Menu")) {
          menu();
        } else {
          play();
        }
      }
    
    }