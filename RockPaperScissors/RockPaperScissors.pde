int player1Choice = 3;
int player2Choice = 3;

int player1Score = 0;
int player2Score = 0;

Boolean player1Move = false;
Boolean player2Move = false;
Boolean results = false;

//array of user options
String[] options = {"Rock", "Paper", "Scissors", " "};

//images
PImage rock, paper, scissors;

void setup() {
  size(800, 800);
  
  rock = loadImage("rock.png");
  paper = loadImage("paper.png");
  scissors = loadImage("scissors.png");
}

void draw() {
  
  background(0, 128, 255);
  textAlign(CENTER);
  imageMode(CENTER);
  
  //displays winner if results variable is true
  if (results) {
    if (player1Choice == player2Choice) {
      textSize(40);
      text("Tie!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 0 && player2Choice == 1) { 
      textSize(40);
      text("Player 2 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 0 && player2Choice == 2) { 
      textSize(40);
      text("Player 1 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 1 && player2Choice == 0) { 
      textSize(40);
      text("Player 1 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 1 && player2Choice == 2) { 
      textSize(40);
      text("Player 2 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 2 && player2Choice == 0) { 
      textSize(40);
      text("Player 2 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
    else if (player1Choice == 2 && player2Choice == 1) { 
      textSize(40);
      text("Player 1 wins!\nPress y to play again and check score.", width / 2, height / 2);
    }
  }
  //instructions screen
  else if (player1Move == false && player2Move == false) {
    textSize(48);
    text("Rock, Paper, Scissors!", width / 2, 60);
    
    textSize(34);
    text("This is a rock, paper, scissors game.\nYou will be presented with 3 options:\nrock, paper and scissors.\nPress a for rock, b for paper, and c for scissors.", width / 2, 200);
    
    textSize(40);
    text("Press n to go to player 1's choice", width / 2, 500);
    
    text("Player 1 Score: " + player1Score + "\nPlayer 2 Score: " + player2Score, width / 2, 650);   
  }
  //player 1's move
  else if (player1Move == true && player2Move == false) {
    textSize(48);
    text("Player 1 Move", width / 2, 60);
    
    image(rock, width / 4, 350);
    image(paper, width / 2, 350);
    image(scissors, 3 * width / 4, 350);
    
    textSize(24);
    text("a: Rock", width / 4, 250);
    text("b: Paper", width / 2, 250);
    text("c: Scissors", 3 * width / 4, 250);
    
    textSize(40);
    text(options[player1Choice], width / 2, 550);
    
    textSize(24);
    text("You can also press the image of your choice.", width / 2, 150);
    text("Press n to lock in your choice and move to player 2's turn.", width / 2, 650);   
  }
  //player 2's move
  else if (player1Move == false && player2Move == true) {
    textSize(48);
    text("Player 2 Move", width / 2, 60);
    
    image(rock, width / 4, 350);
    image(paper, width / 2, 350);
    image(scissors, 3 * width / 4, 350);
    
    textSize(24);
    text("a: Rock", width / 4, 250);
    text("b: Paper", width / 2, 250);
    text("c: Scissors", 3 * width / 4, 250);
   
    textSize(40);
    text(options[player2Choice], width / 2, 550);
    
    textSize(24);
    text("You can also press the image of your choice.", width / 2, 150);
    text("Press n to lock in your choice and see who won.", width / 2, 650);
  }
}

void keyPressed() {
  //if user presses n on instructions screen
  if (key == 'n' && player1Move == false && player2Move == false) {
    player1Move = true;
  }
  
  //defines player 1 choice by pressing a, b, or c
  if (player1Move == true && player2Move == false && key == 'a') {
    player1Choice = 0;
  }
  else if (player1Move == true && player2Move == false && key == 'b') {
    player1Choice = 1;
  }
  else if (player1Move == true && player2Move == false && key == 'c') {
    player1Choice = 2;
  }
  //if the user chooses to lock in their choice
  else if (player1Move == true && player2Move == false && key == 'n' && player1Choice != 3) {
    player1Move = false;
    player2Move = true;
  }
  
  //defines player 2 choice by pressing a, b, or c
  if (player2Move == true && player1Move == false && key == 'a') {
    player2Choice = 0;
  }
  else if (player2Move == true && player1Move == false && key == 'b') {
    player2Choice = 1;
  }
  else if (player2Move == true && player1Move == false && key == 'c') {
    player2Choice = 2;
  }
  else if (player2Move == true && player1Move == false && key == 'n' && player2Choice != 3) {
    results = true;
  }
  //if user chooses to lock in their answer, program proceeds to results screen
  else if (player2Move == true && player1Move == false && key == 'y' && results == true) {
    results = false;
    player1Move = false;
    player2Move = false;
    
    //adds score based on who won
    if (player1Choice == 0 && player2Choice == 1) { 
      player2Score++;
    }
    else if (player1Choice == 0 && player2Choice == 2) { 
      player1Score++;
    }
    else if (player1Choice == 1 && player2Choice == 0) { 
      player1Score++;
    }
    else if (player1Choice == 1 && player2Choice == 2) { 
      player2Score++;
    }
    else if (player1Choice == 2 && player2Choice == 0) { 
      player2Score++;
    }
    else if (player1Choice == 2 && player2Choice == 1) { 
       player1Score++;
    }
    
    //resets player choice to default values
    player1Choice = 3;
    player2Choice = 3;
  }        
} 

void mousePressed() {
  
  //if it is player 1 move, user can click on images to make their choice
  if (player1Move == true && player2Move == false && results == false) {
    if((mouseX > 108 && mouseX < 292) && (mouseY > 260 && mouseY < 440)) {
    player1Choice = 0;
    }
    else if ((mouseX > 311 && mouseX < 489) && (mouseY > 259 && mouseY < 441)) {
      player1Choice = 1;
    }
    else if ((mouseX > 508 && mouseX < 692) && (mouseY > 260 && mouseY < 440)) {
      player1Choice = 2;
    }
  }
  
  //if it is player 2 move, user can click on images to make their choice
  if (player1Move == false && player2Move == true && results == false) {
    if((mouseX > 108 && mouseX < 292) && (mouseY > 260 && mouseY < 440)) {
      player2Choice = 0;
    }
    else if ((mouseX > 311 && mouseX < 489) && (mouseY > 259 && mouseY < 441)) {
      player2Choice = 1;
    }
    else if ((mouseX > 508 && mouseX < 692) && (mouseY > 260 && mouseY < 440)) {
      player2Choice = 2;
    }
  }
}

