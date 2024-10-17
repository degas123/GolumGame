class GameSettings
{
  boolean mouseclicked;
  GameSettings( boolean mouseclicked) {
    this.mouseclicked=mouseclicked;
  }

  void gameSelect() {
    fill(255);
    textSize(50);
    text("Game mode", width/2-140, 40);
    textSize(30);

    if (mouseX>=450&&mouseX<=510&&mouseY<=100&&mouseY>=80) {
      fill(0, 255, 2);
      text("Easy", width/2-50, 100);
      if (mousePressed) {
        gamemode=easy;
      }
    } else if (mouseX>=450&&mouseX<=550&&mouseY<=175&&mouseY>=155)
    {
      fill(0, 255, 2);
      text("Normal", width/2-50, 175);
      if (mousePressed) {
        gamemode=normal;
      }
    } else if (mouseX>=450&&mouseX<=510&&mouseY<=250&&mouseY>=230)
    {
      fill(0, 255, 2);
      text("Hard", width/2-50, 250);
      if (mousePressed) {
        gamemode=hard;
      }
    } else if (mouseX>=450&&mouseX<=505&&mouseY<=400&&mouseY>=380) {
      fill(255, 0, 0);
      if (mousePressed) {
        text("Exit", width/2-50, 400);
        gamemode=exit;
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
