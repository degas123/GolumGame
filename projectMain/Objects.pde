abstract class Objects
{
  int x;
  int y;
  int size;
  int speed;
  int count =0;
  int armCount=0;
  int headCount=0;
  int legCount=0;
  int RedArmCount=0;
  int RedHeadCount=0;
  Objects(int x, int y, int speed)
  {
    this.y=y;
    this.x=x;
    this.speed=speed;
  } //objects
  void move()
  {
    this.x -= speed;
    //p1.position(x,y);
  } //movemnt
  abstract void make();
  


  void update()
  {
    this.make();
    this.move();
    //print(speed);
  }
 abstract boolean crash(Pieces pieces);
 


  boolean gameOver()
  {
    return x<(5); //width of the screen
  }

  void Count() {
    count +=1 ;
  }
  void stop()
  {
    speed=0;
  }
}
