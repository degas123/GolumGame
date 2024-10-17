class GameSettings
{

  GameSettings( ) {
  }

  void gameSelect() {
    fill(165, 169, 180);// sets coloer to Metalic silver
    textSize(50);
    text("Game mode", width/2-140, 40);
    textSize(30);

    if (mouseX>=450&&mouseX<=510&&mouseY<=100&&mouseY>=80) {// checks mouse Position
      fill(0, 225, 20);//sets color to green
      text("Easy", width/2-50, 100);
      if (mousePressed) { // activates on mousepressed
        gamemode=easy;// sets the game mode
      }
    } else if (mouseX>=450&&mouseX<=550&&mouseY<=175&&mouseY>=155)// checks mouse Position
    {
      fill(255, 128, 13);//sets color to orange
      text("Normal", width/2-50, 175);
      if (mousePressed) {// activates on mousepressed
        gamemode=normal;// sets the game mode
      }
    } else if (mouseX>=450&&mouseX<=510&&mouseY<=250&&mouseY>=230)// checks mouse Position
    {
      fill(255, 0, 2);//sets color to red
      text("Hard", width/2-50, 250);
      if (mousePressed) {// activates on mousepressed
        gamemode=hard;// sets the game mode
      }
    } else if (mouseX>=450&&mouseX<=505&&mouseY<=400&&mouseY>=380)// checks mouse Position
    {
      fill(255, 233, 0);//sets color to yellow
      text("Exit", width/2-50, 400);
      if (mousePressed) {// activates on mousepressed
        
        gamemode=exit;// exits the game
      }
    } else
    {
      text("Easy", width/2-50, 100);
      text("Normal", width/2-50, 175);
      text("Hard", width/2-50, 250);
      
      text("Exit", width/2-50, 400);
    }
  }
}
