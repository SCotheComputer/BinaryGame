//CLASS to create each INSTANCE of either 0s or 1s on the background.
class binaryBG {
  float x; //X coordinate for the text.
  float y; //Y coordinate for the text.
  String text; //The text to be displayed
  int speed; //The speed the text will move down the screen.
  int[]  txtSizes = { 
    5, 10, 15, 20, 25
  }; //Array of possible text sizes.

  //CONSTRUCTOR for the background text.
  binaryBG() {
    x = random(0, 640); //Starts the text at a random X positions.
    y = random(0, 480); //Starts the text at a random Y positions.
    speed = int(random(1, 5)); //Sets a random speed for the text.
    //Randomises whether the text is a 1 or a 0.
    if (int(random(0, 2)) == 1) {
      text = "1";
    }
    else {
      text = "0";
    }
  }

  //Display METHOD for the background numbers.
  void display() {
    textSize(txtSizes[speed]); //Picks a text size dependent upon the speed of the text from the txtSizes array.
    fill(225, 116, 0, 180); //Sets the fill colour - the transparency is varied by the speed.
    text(text, x, y); //Draws the text.

    //Incredments the Y coordinate by the value of speed until the text hits the botton of the screen.
    if (y < 480) { 
      y = y + speed;
    }
    else {
      y = 0;
      x = random(0, 640);
      speed = int(random(1, 5));
    }
  }
}
