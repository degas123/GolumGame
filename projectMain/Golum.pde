class Golum extends Objects
{
  int x;
  int y;
  int size;
  int speed;
  int count =0;
  PImage img;
  PImage body = loadImage("Body.png");
  PImage HeadChest = loadImage("HeadChest.png");
  PImage HeadArms = loadImage("HeadArms.png");
  PImage ArmsChest = loadImage("ArmsChest.png");
  PImage HeadLegs = loadImage("HeadLegs.png");
  PImage LegsChest = loadImage("LegsChest.png");
  PImage LegsArms = loadImage("LegsArms.png");
  PImage Golum = loadImage("Golum.PNG");
  Golum(int x, int y, int speed)
  {
    super(x, y, speed);
    this.y=y;
    this.x=x;
    this.speed=speed;
    body = loadImage("Body.png");
    HeadChest = loadImage("HeadChest.png");
    HeadArms = loadImage("HeadArms.png");
    ArmsChest = loadImage("ArmsChest.png");
    HeadLegs = loadImage("HeadLegs.png");
    LegsChest = loadImage("LegsChest.png");
    LegsArms = loadImage("LegsArms.png");
    Golum = loadImage("Golum.PNG");
  } //objects
  void move()
  {
    this.x -= speed;
    //p1.position(x,y);
  } //movemnt
  void make()
  {
    if (armCount==0 && legCount==0 && headCount==0) {
      img=body;
      image(body, x, y);
    } else if ( armCount==0 && legCount==0 && headCount==1) {
      img=HeadChest;
      image(HeadChest, x, y);
    } else if ( armCount==0 && legCount==1 && headCount==0) {
      img=LegsChest;
      image(LegsChest, x, y);
    } else if ( armCount==1 && legCount==0 && headCount==0) {
      img=ArmsChest;
      image(ArmsChest, x, y);
    } else if ( armCount==0 && legCount==1 && headCount==1) {
      img = HeadLegs;
      image(HeadLegs, x, y);
    } else if ( armCount==1 && legCount==0 && headCount==1) {
      img=HeadArms;
      image(HeadArms, x, y);
    } else if ( armCount==1 && legCount==1 && headCount==0) {
      img=LegsArms;
      image(LegsArms, x, y);
    } else if ( armCount==1 && legCount==1 && headCount==1) {
      img=Golum;
      image(Golum, x, y);
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
