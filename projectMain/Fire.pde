class Fire {

  int x; 
  int y;
  int speed =2;
    Fire(int x , int y) {
      this.x=x;
      this.y=y;
  }
  void move()
  {
    this.x += speed;
    //p1.position(x,y);
  } //movemnt
  void make() {

    image(fireball[imgCounter/12 % fireball.length], this.x, this.y);
      imgCounter++;
  }


  void update()
  {
    this.make();
    this.move();
    //print(speed);
  }
    boolean burn(int mX, int mY)
  {
    return abs(this.x- mX) < 15 && abs(this.y-mY) < 15;
  }
    void stop()
  {
    speed=0;
  }
}
