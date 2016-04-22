//CLASS for the timer bar.
class timerBar {
  //Co-Ordinates and size of the timer bar.
  int x = 30;
  float y = 30;
  int w = 130;
  float h = 420;

  //CONSTRUCTOR for the timer bar - this is necessary, however is blank as no parameters need to passed as there will only ever be one timer bar.
  timerBar() {
  }
  
  void display() {
    if (started == true && gameOver == false) { //Only appears when the game has been started, but isn't over yet.
    
      //>>>ENDING THE GAME<<<
      if (endTime - millis() <= 0) { //Ensures the timer bar stops when it reaches the bottom.
        gameOver= true; //Sets the gameOver boolean to true if the user runs out of time.
        
        //>>>DEALING WITH HIGH SCORES<<<
        //Adds a new row to the scores table called newRow.
        TableRow newRow = scoresTable.addRow();
        //Adds the username combined with the date and time to make a unique key to be used in the scores dictionary later. 
        newRow.setString("userName", userName + "_" + year() + month() + day() + hour() + minute() + second());
        //Adds the score to the scores table.
        newRow.setInt("score", score);
        //Saves the scoresTable
        //!!!POTENTIAL PROBLEM - Will this work with multiple users accessing the scoresTable.csv file at the same time?
        //!!!POTENTIAL PROBLEM - Will users be able to write to the scoresTable.csv file if they have restricted access rights?
        saveTable(scoresTable, "scoresTable.csv");
        //Transfers the content of the scoresTable to the scores dictionary for sorting.
        for (int i = 0; i < scoresTable.getRowCount(); i++) {
          scoresDict.set(scoresTable.getString(i, "userName"), scoresTable.getInt(i, "score"));
        }
        //Sorts the scores dictionary into reverse order, i.e. descending.
        scoresDict.sortValuesReverse();
      }
      
      //>>>MAKING THE TIMER COUNT DOWN<<<
      fill(225, 116, 0, 200); //Standard colours for the timer bar.
      //Creates a dynamic rectangle - the y position and height of the rectangle will change based upon the difference between the end time and current time.
      rect(x, y, w, h); 
      //endTime is created when the start button is clicked. 
      //It is calculated by taking the millis() value (number of milliseconds the program has been running and adding 34000 to it
      if (endTime - millis() < 30000) { //Ensures the timer doesn't start straight away and waits for the 3,2,1,Go countdown to happen.
        //Creates a value between 0 and 420, starting at 420 and moving downwards as the millis() value gets closer to the endTime.
        //The size of the menu / timer background is 460, the maximum size of the timer itself should therefore be 420 to allow for a 20px border.
        h = ((endTime - millis())/30000)*420;
        //Due to the way in which processing creates rectangles, without the code below the timer bar would move upwards.
        //The Y position of the bar therefore increases at the height of the bar decreases. 
        y = 450 - h;
      }
    }
  }
}

