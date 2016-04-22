//CLASS for the main game window.
class gameWindow {
  //Sets the size and position for the game window.
  int x = 190;
  int y = 20;
  int w = 430;
  int h = 440;
  //Sets a maximum length for the answer - this is used for validation of user data entry later.
  int aTextLength = 3;
  //Strings to be used to display the question and answer.
  String questionText = "";
  String answerText = "";
  //Values to be displayed during the countdown.
  String[] displayValues = {
    "GO!", "1", "2", "3"
  };

  //Constructor for gameWindow can remain blank as all variables have been predetermined and there will only ever be one game window.
  gameWindow() {
  } 

  void mousePressed() {
    //<<<RESTARTING THE GAME>>>
    //The code below determines if the game is over and then allows the user to click the Main Menu button.
    //This then resets all the relevant boolean and integer values to restart the game.
    if (gameOver == true) {
      if (mouseX > x+20 && mouseX < x + (w - 20) && mouseY > y +(3*(h/4)) && mouseY <y+(3*(h/4)) + (h/6)) {
        started = false;
        score = 0;
        qNumber = 1;
        gameOver = false;
      }
    }

    //<<ACCESSING THE HIGH SCORES TABLE>>
    //The code below will swap the value of the scores boolean - this is used later to display the high scores.
    if (started == false && gameOver == false) {
      if (mouseX > x+20 && mouseX < x + (w/3) && mouseY > y && mouseY <y+(h/10)) {
        fill(166, 81, 0, 230);
        rect(x, y, w/3, h/10);
        //XOr will swap a boolean value.
        scores ^= true;
      }
    }
  }

  void display() {
    //Creates the background rectangle for the game window.
    fill(1, 86, 102, 125);
    rect(x, y, w, h);

    //Creates the high scores button
    //This is displayed until the game starts so contains less arguments for the primary if statement that other components.
    if (started == false && gameOver == false) {
      if (mouseX > x+20 && mouseX < x + (w/3) && mouseY > y && mouseY <y+(h/10)) {
        fill(1, 86, 102, 240);
      }
      else {
        fill(1, 86, 102, 200);
      }
      textSize(15);
      rect(x, y, w/3, h/10);
      fill(255, 255, 255, 255);
      text("High Scores", x, y, w/3, h/10);
    }

    //<<<CREATING THE GAME OVER DISPLAY>>>
    //Determines if the game is over or not.
    if (gameOver == true) {
      //Creates a roll over effect for the Main Menu button.
      if (mouseX > x+20 && mouseX < x + (w - 20) && mouseY > y +(3*(h/4)) && mouseY <y+(3*(h/4)) + (h/6)) {
        fill(1, 86, 102, 240);
      }
      else {
        fill(1, 86, 102, 200);
      }
      //Creates the Main Menu button.
      rect(x+20, y+(3*(h/4)), w-40, h/6);
      //Shows the users score and creates the text for the Main Menu button.
      fill(255, 255, 255, 255);
      textSize(40);
      text("Score: " + score, x, y, w, h/3);
      textSize(30);
      text("Main Menu", x+20, y+(3*(h/4)), w-40, h/6);
      
      //<<<DISPLAYING THE HIGH SCORES>>>
      //text size is not inside the loop as it only needs to happen once.
      textSize(15);
      //Loops once for each of the entries in the scores dictionary OR until it has run through 10 times.
      for (int i = 0; i < scoresDict.size() && i < 10; i++) {
        //Temporarily sets the alignment to LEFT.
        textAlign(LEFT);
        //Finds the location of the _ character in the usernames stored in the scores dictionary.
        int cutter = scoresDict.key(i).indexOf("_");
        //Writes a line of text, this y position of which is variable, dependent upon the value of i.
        //The username with the date extension is being used as the unique key for the scores dictionary.
        //It is therefore selected using the scoresDict.key function.
        //The cutter variable is used to select only the username as a substring, therefore removing the date extension that does not need to be displayed.
        text("[" + (i+1) + "] " + scoresDict.key(i).substring(0, cutter) + " : " + scoresDict.get(scoresDict.key(i)), x+w/3, y+120+(i*20), w, h/10);
        //Returns the alignment to the original CENTER position.
        textAlign(CENTER, CENTER);
      }
    }

    //<<<CREATING THE DEFAULT WELCOME MESSAGE>>>
    //Determines if the game has been started, finished or if the high scores need to be displayed
    if (started == false && gameOver == false && scores == false) {
    //Creates the rollover effect for the high scores button.
      if (mouseX > x+20 && mouseX < x + (w/3) && mouseY > y && mouseY <y+(h/10)) {
        fill(1, 86, 102, 240);
      }
      else {
        fill(1, 86, 102, 200);
      }
      //Creates the two welcome messages.
      fill(255, 255, 255, 255);
      textSize(20);
      text("WELCOME TO CONVERTOR " + userName.toUpperCase() +"!", x, y, w, h/2);
      textSize(20);
      text("Change the settings and click START to begin!", x, y+(h/3), w, h/2);
    }

    //<<<DISPLAYING THE HIGH SCORES>>>
    //
    else if (started == false && gameOver == false && scores == true) {
      textSize(40);      
      fill(255, 255, 255, 255);
      text("High Scores", x, y, w, h/3);
      
      textSize(15);
      for (int i = 0; i < scoresDict.size() && i < 10; i++) {
        textAlign(LEFT);
        int cutter = scoresDict.key(i).indexOf("_");
        text("[" + (i+1) + "] " + scoresDict.key(i).substring(0, cutter) + " : " + scoresDict.get(scoresDict.key(i)), x+w/3, y+120+(i*20), w, h/10);
        textAlign(CENTER, CENTER);
      }
    }

    else if (started == true && gameOver == false && endTime - millis() > 30000) {
      textSize(100);
      fill(255, 255, 255, 255);
      text(displayValues[round((endTime - millis())-30000)/1000], x, y, w, h);
    }

    else if (started == true && gameOver == false && mode == 1 && endTime - millis() < 30000) {
      aTextLength = 3;
      if (qNumber == score+1) {
        binaryGen();
      }
      fill(255, 255, 255, 255);
      textSize(20);
      text("Score: " + score, x, y, w/3, h/10);
      textSize(40);
      text(questionText, x, y, w, h/2);
      fill(1, 86, 102, 200);
      rect(x+20, y+(h/2), w-40, h/4);
      fill(255, 255, 255, 255);
      text(answerText, x+20, y+(h/2), w-40, h/4);
    }
    else if (started == true && gameOver == false && mode == 2 && endTime - millis() < 30000) {
      aTextLength = difficulty;
      if (qNumber == score+1) {
        decimalGen();
      }
      fill(255, 255, 255, 255);
      textSize(20);
      text("Score: " + score, x, y, w/3, h/10);
      textSize(40);
      text(questionText, x, y, w, h/2);
      fill(1, 86, 102, 200);
      rect(x+20, y+(h/2), w-40, h/4);
      fill(255, 255, 255, 255);
      text(answerText, x+20, y+(h/2), w-40, h/4);
    }
  }

  void binaryGen() {
    //This array is declared in the function to allow the array size to dynamically change based upon the difficulty.
    String[] binParts = new String[difficulty];
    questionText = "";
    //Builds a random string of 0s and 1s - the number of iterations and therefore string length is determined by the difficulty.
    for (int i = 0; i < difficulty; i++) {
      if (int(random(0, 2)) == 1) {
        binParts[i] = "1";
        questionText = questionText + binParts[i];
      }
      else {
        binParts[i] = "0";
        questionText = questionText + binParts[i];
      }
    }
    //Increments the question number to avoid new strings being generated constantly.
    qNumber = qNumber + difficulty;
  }

  void decimalGen() {
    if (difficulty == 4) {
      questionText = str(int(random(0, 15)));
    }
    else if (difficulty == 6) {
      questionText = str(int(random(0, 63)));
    }
    else {
      questionText = str(int(random(0, 255)));
    }
    qNumber = qNumber + difficulty;
  }

  void keyPressed() {
    if (started == true && gameOver == false && endTime - millis() < 30000) {
      if (answerText.length () > 0 && answerText.length() <=aTextLength && key == BACKSPACE) {
        answerText = answerText.substring(0, answerText.length()-1);
      }
      if (answerText.length() < aTextLength) {
        if (key == '0') {
          answerText = answerText + '0';
        }
        if (key == '1') {
          answerText = answerText + '1';
        }
        if (key == '2' && mode == 1) {
          answerText = answerText + '2';
        }
        if (key == '3' && mode == 1) {
          answerText = answerText + '3';
        }
        if (key == '4' && mode == 1 ) {
          answerText = answerText + '4';
        }
        if (key == '5' && mode == 1) {
          answerText = answerText + '5';
        }
        if (key == '6' && mode == 1) {
          answerText = answerText + '6';
        }
        if (key == '7' && mode == 1) {
          answerText = answerText + '7';
        }
        if (key == '8' && mode == 1) {
          answerText = answerText + '8';
        }
        if (key == '9' && mode == 1) {
          answerText = answerText + '9';
        }
      }
      if (key == ENTER || key == RETURN) {
        if (mode == 1) {
          if (int(answerText) == unbinary(questionText)) {
            answerText = "";
            score = score + difficulty;
            endTime = endTime + 1000;
          }
          else {
            fill(219, 27, 27, 200);
            rect(x+20, y+(h/2), w-40, h/4);
          }
        }
        if (mode == 2) {
          if (int(questionText)==(unbinary(answerText))) {
            answerText = "";
            score = score + difficulty;
            endTime = endTime + 1000;
          }
          else {
            fill(219, 27, 27, 200);
            rect(x+20, y+(h/2), w-40, h/4);
          }
        }
      }
    }
  }
}
