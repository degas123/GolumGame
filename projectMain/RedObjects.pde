class RedObjects extends Objects
{
  int x;
  int y;
  int size;
  int speed;
  int count =0;
  PImage img;
  PImage body ;
  PImage HeadChestRed ;
  PImage HeadChestArmsOne ;
  PImage RedArmsChest ;
  PImage RedArmsTwo ;
  PImage RedGolum ;
  RedObjects(int x, int y, int speed)
  {
    super (x, y, speed);
    this.y=y;
    this.x=x;
    this.speed=speed;
    body = loadImage("ChestRed.png");
    HeadChestRed = loadImage("HeadChestRed.png");
    HeadChestArmsOne = loadImage("HeadChestArmsOne.png");
    RedArmsChest = loadImage("RedArmsChest.png");
    RedArmsTwo = loadImage("RedArmsTwo.png");
    RedGolum = loadImage("RedGolum.png");
  } //objects
  void move()
  {
    this.x -= speed;
    //p1.position(x,y);
  } //movemnt
  void make()
  {
    if (RedArmCount==0 && RedHeadCount==0) {
      img=body;
      image(body, x, y);
    } else if ( RedArmCount==0 && RedHeadCount==1) {
      img=HeadChestRed;
      image(HeadChestRed, x, y);
    } else if ( RedArmCount==1 && RedHeadCount==0) {
      img=RedArmsChest;
      image(RedArmsChest, x, y);
    } else if ( RedArmCount==2 && RedHeadCount==0) {
      img=RedArmsTwo;
      image(RedArmsTwo, x, y);
    } else if ( RedArmCount==1 && RedHeadCount==1) {
      img=HeadChestArmsOne;
      image(HeadChestArmsOne, x, y);
    } else if ( RedArmCount==2 && RedHeadCount==1) {
      img=RedGolum;
      image(RedGolum, x, y);
    }
    img.resize(75, 75);
  }

  boolean crash(Pieces pieces)
  {
    return abs(this.x- pieces.componentX) < img.width && abs(this.y-pieces.componentY) < img.height;
  }


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
