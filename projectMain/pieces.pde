abstract class Pieces {
  float componentX, componentY; 
  PImage img;
  
  Pieces(float componentX, float componentY)
  {
    this.componentX=componentX;
    this.componentY=componentY;
  }

  void makeP()
  {
    img.resize(75, 75);
    image(img, componentX, componentY);
  }


  abstract void moveP();

  void updateP()
  {
    this.makeP();
    this.moveP();
  }

  abstract void position();

}
