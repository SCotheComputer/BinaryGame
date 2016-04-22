//Parent CLASS for menu items
class menuItem {
  //The order that the item will appear in the list of menu options.
  int order;
  //co-ordinates and sizes for the menu items.
  int x = 30;
  int y;
  int w = 130;
  int h = 76;
  //What will be written on the menu item
  String menuText;
  //default RGB values for the menu items.
  int r = 1;
  int g = 86;
  int b = 102;
  float a = 200; //transparency has been set as a variable so it can be easily manipulated for roll-over effects.

  //CONSTRUCTOR for the menu items.
  //only the order and the text will change between different items and therefore only these need to be entered.
  menuItem(int tempOrder, String tempMenuText) {
    menuText = tempMenuText;
    order = tempOrder;
    y = ((10 * (order-1)) + (76 * (order-1)) + 30); //Y position is determined by the order of the button.
  } 

  //Function to be run if the menu items are clicked.
  void mousePressed() {
    if (started == false) { //Stops mouse clicks doing anything while the game is running.
      if (mouseX > x  && mouseX < x + w && mouseY > y && mouseY < y + h) { //Ensure the mouse click is inside the menu item in question.
        //<<FOR ALL MENU ITEMS>>
        //Creates a short flash to indicate to the user that the button has been pressed.
        fill(166, 81, 0, a*1.3);
        rect(x, y, w, h);
        fill(255, 255, 255, a* 1.3);
        textSize(16);
        text(menuText, x+20, y, w-40, h);

        //<<<CHANGING THE GAME MODE>>>
        if (order == 1) { //First menu item is the Binary to Decimal button.
          mode = order; //Sets the mode to the order, i.e. 1.
        }
        if (order == 2) { //Second menu item is the Decimal to Binary button.
          mode = order; //Sets the mode to the order, i.e. 2.
        }
        //<<<CHANGING THE DIFFICULTY>>>
        //Rotates the difficulty through 4, 6 and 8 for easy, medium and hard.
        if (order == 3 && difficulty < 8) {
          difficulty = difficulty + 2;
        }
        else if (order == 3 && difficulty >= 8) {
          difficulty = 4;
        }
      }
    }
  }

  
  void display() {
    if (started == false) { //Ensures the menu items are not shown while the game is running.
      //<<<CHANGING THE LOOK OF THE MODE BUTTONS i.e. Binary to Decimal & Decimal to Binary.>>>
      if (order == mode) { //Determines if the buttons associated game mode has been selected.
        fill(225, 116, 0, a*1.3); //Sets the colour to the orange highlighted colour if that mode is selected.
      }
      else if (mouseX > x  && mouseX < x + w && mouseY > y && mouseY < y + h) {
        fill(r, g, b, a*1.3); //Changes the colour for the menu items if the mouse is over them.
      }
      else {
        fill(r, g, b, a); //Sets the menu items to their default colours when inactive.
      }
      //Creates the menu item itself and applies the text to it.
      rect(x, y, w, h);
      fill(255, 255, 255, a*1.3);
      textSize(16);
      text(menuText, x+20, y, w-40, h);
    }
  }
}

