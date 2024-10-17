class Games // this runs the game //<>//
{
  int gameCounter=0;
  int score;
  int highScore;
  int rounds= 5;// the amount of rounds that will be made
  int objectsOneScreen=0;
  int y;
  int gap=0;
  int fireX=0;
int lives =3;

  Games(int highScore) {
    this.highScore=highScore;
  }
  void game(int highScore) {
    highScoreCard(score);
    gethighScore();
    


    if (ObjectList.size()==0 || (ObjectList.size()<2 && gameCounter< rounds || objectsOneScreen==1) ) {
      //currentpiece.updateP();
      gameCounter+=1;// game counter tracks the amount of times new items are made.
      for (int j=0; j<=gamemode; j++)// using the game mode it will make items which is supplyed in project main
      {
        int chance =(int) random(0, 10);// adds a spesal golum that gives more points if maked,
        int randomY=(int) random(1, 5);
        if (chance == 1) {
          ObjectList.add(new RedObjects(width+gap, height/2, speed));
        }
        if ( chance >=4) {
          int randomFireY =(int) random(50, 400);
          FireBallList.add(new Fire(fireX, randomFireY));
        }


        if (randomY==1 && y!=100) {
          y=100;
          gap+=50;
          makeNewObject(gap, y, objectsOneScreen);
        } else if (randomY==2&& y!=150) {
          y=150;
          gap+=50;
          makeNewObject(gap, y, objectsOneScreen);
        } else if (randomY==3 && y!=200) {
          y=200;
          gap+=50;
          makeNewObject(gap, y, objectsOneScreen);
        } else if (randomY==4&& y!=250) {
          y=250;
          gap+=50;
          makeNewObject(gap, y, objectsOneScreen);
        } else if (randomY==4&& y!=300) {
          y=300;
          gap+=50;
          makeNewObject(gap, y, objectsOneScreen);
        }
      }
    }
    drawBackGround();

    for ( int i = ObjectList.size()-1; i>0; i--) {
      Objects currentObject = ObjectList.get(i);
      currentObject.update();

      text("Current Score :"+score, 50, 50);
      text("High Score :"+highScore, 50, 20);
    

      boolean  fin=ObjectList.get(i).gameOver();
      if (((currentObject.armCount != 1 || currentObject.legCount != 1 || currentObject.headCount != 1 )&& fin )|| lives ==0)
      {
        ObjectList.get(i).stop();
        background(0);
        text("GAME OVER", width/2, height/2);
        text("Press the spacebar button to retun to the main screen", 50, height/2+30);
        if (key== ' '&& keyPressed) {// checks if the space bar has been presesd.
          highScoreCard(score);
          gethighScore();
          gamemode=mode;
          fin=false;
          ObjectList.clear();// clsers the array to alow the game to restart if the player fails to make all the iteams,
          FireBallList.clear();
          gameCounter=0;
          score=0;
          objectsOneScreen=0;
          lives=1;

          return;// returns from the class
        }
      }



      for ( int p= PiecesList.size()-1; p>=0; p--)
      {
        Pieces currentpiece = PiecesList.get(p);
        PiecesList.get(p).updateP();


        if (currentObject.crash(currentpiece)) {

          currentpiece.position();// moves the piece back to its staring position
          if (!fin) {// makes sure players can not increses ther score when the game has ended.
            if (currentpiece == PiecesList.get(0) && currentObject.headCount == 0) {
              currentObject.headCount=1;
              score=score+10;
            } else if (currentpiece == PiecesList.get(1)&& currentObject.legCount == 0)// checks that the current pease is the one that is scoring that Addes the the counter
            {
              currentObject.legCount=1;
              score=score+10;
            } else if (currentpiece == PiecesList.get(2) && currentObject.armCount == 0)// the armCount ==0 is the stop the player increasing there score with out completing the object
            {
              currentObject.armCount=1;
              score=score+10;
            } else if (currentpiece == PiecesList.get(3) && currentObject.RedArmCount == 0|| currentObject.RedArmCount==1) {
              currentObject.RedArmCount=1+currentObject.RedArmCount;
              score=score+50;
              currentObject.update();
            } else if (currentpiece == PiecesList.get(4) && currentObject.RedHeadCount == 0) {
              currentObject.RedHeadCount=1;
              score=score+50;
              currentObject.update();
            }
          }
        }
        // changes the counter by +1 to see how meany pices have colided with the object
        if ((currentObject.armCount == 1 && currentObject.legCount == 1 && currentObject.headCount == 1)|| (currentObject.RedHeadCount==1 && currentObject.RedArmCount==2)) {


          ObjectList.remove(currentObject);
          objectsOneScreen-=1;
          gap=0;
        }
      }
    


}
for ( int b = FireBallList.size()-1; b>0; b--) {
      Fire currentFire = FireBallList.get(b);
      currentFire.update();

      if (currentFire.burn(mouseX, mouseY)&& lives >0) {
        FireBallList.get(b).stop();
        lives-=1;
        
      }
      if (currentFire.x>width){
      FireBallList.remove(b);
      }
    }  

    if (ObjectList.size()-1==0 && gameCounter>=rounds) {
      background(0);
      text("Current Score :"+score, 50, 50);
      text("You have completed the level now try a harder mode!", 200, height/2-30);
      text("Press the spacebar button to retun to the main screen", 200, height/2);

      if (key== ' '&& keyPressed) {
        highScoreCard(score);
        gethighScore();
        ObjectList.clear();// clsers the array to alow the game to restart when all the objects are removded
        FireBallList.clear();//clears the items 
        gamemode=mode;
        gameCounter=0;
        score=0;
        objectsOneScreen=0;
        gap=0;
        lives=1;
        return; // end of class / returns to the main screen.
      }
    }
    
}
}

void makeNewObject(int gap, int randomY, int objectsOneScreen ) {

  ObjectList.add(new Golum(width+gap, randomY, speed));// adds new itmes to the array
  objectsOneScreen+=1;
}
