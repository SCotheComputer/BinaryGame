//Uses an array to declare a set number of binary numbers objects for the background.
binaryBG[] binaryBGS = new binaryBG[500]; //The number in [xxx] is the number of objects.
//Declares objects for the menu items
menuItem b2d, d2b;
altMenu diff, timer;
startButton start;
timerBar timerBar;
gameWindow gameWindow;

//Declaring global varibales
Table scoresTable;
int mode = 1; //Switches between binary to decimal and decimal to binary modes.
int score = 0; //Keeps a record of the score.
int qNumber = 1; //Keeps a record of the question that the user is on.
int difficulty = 4; //Difficulty, measured in the number of bits the user is attempting to solve. Easy = 4, Medium = 6, Hard = 8.
float beginTime; //Uses millis() to determine the time when the game was started
float endTime; //Calculated using beginTime and adding 30,000 or 30 seconds to it.
boolean started = false; //Determines whether the game has been started or not.
boolean gameOver = false;
boolean scores = false;
boolean timerOn = true;
String userName = System.getProperty("user.name");
IntDict scoresDict;

void setup() {
  scoresDict = new IntDict();
  scoresTable = new Table();
  scoresTable = loadTable("scoresTable.csv", "header");
  for (int i = 0; i < scoresTable.getRowCount(); i++) {
    scoresDict.set(scoresTable.getString(i, "userName"), scoresTable.getInt(i, "score"));
  }
  scoresDict.sortValuesReverse();
  size(640, 480); //Sets the size of the program.
  //Uses a  for loop to create the objects - no parameters are passed as all are created by the class within the constructor.
  for (int i = 0; i < binaryBGS.length; i++) {
    binaryBGS[i] = new binaryBG();
  }

  //Creates objects for the menu items - passing in the position in the menu and the text to be displayed.
  d2b = new menuItem(1, "Binary to Decimal");
  b2d = new menuItem(2, "Decimal to Binary");
  diff = new altMenu(3, "Difficulty", "Easy", "Medium", "Hard");
  timer = new altMenu(4, "Timer", "ON", "OFF");
  start = new startButton(5, "START!");
  timerBar = new timerBar();
  gameWindow = new gameWindow();
}

void draw() {
  background(0, 153, 153); //Redraws the background to avoid 'ghosting' of previous images.
  textAlign(CENTER, CENTER); //Sets the vertical and horizontal align to CENTER.
  //Uses a for loop to run the display method for each binary number object.
  for (int i = 0; i < binaryBGS.length; i++) {
    binaryBGS[i].display();
  }
  //Creates the menu on the left of the program.
  stroke(0, 0, 0, 0);
  fill(1, 86, 102, 125);
  rect(20, 20, 150, 440);
  d2b.display();
  b2d.display();
  diff.display();
  start.display();
  timer.display();
  timerBar.display();  
  gameWindow.display();
  fill(255, 255, 255);
}

void mouseReleased() {
  diff.mouseReleased();
  timer.mouseReleased();
  start.mouseReleased();
}

void mousePressed() {
  d2b.mousePressed();
  b2d.mousePressed();
  diff.mousePressed();
  timer.mousePressed();
  start.mousePressed();
  gameWindow.mousePressed();
}

void keyPressed() {
  gameWindow.keyPressed();
}
