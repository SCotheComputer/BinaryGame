//Sub CLASS for the start button to allow it to begin the game.
class startButton extends menuItem {

  //CONSTRUCTOR for the start button - only needs to inherit standard parameters from its parent.
  startButton(int tempOrder, String tempMenuText) {
    super(tempOrder, tempMenuText);
  }

  //<<<MAKING THE GAME START>>
  //Mouse release function for the start button.
  void mouseReleased() {
    if (mouseX > super.x  && mouseX < super.x + super.w && mouseY > super.y && mouseY < super.y + super.h) {
      //Sets the end time for the game to be the current millis() value with 34000 milliseconds added to it. 
      //This allows time for the 4 second countdown and the game to then run for 30 seconds.
      endTime = millis() + 34000;
      //Sets the started boolean to false - this is used by other parts of the program to stop displaying menus etc.
      started = true;
    }
  }
}

