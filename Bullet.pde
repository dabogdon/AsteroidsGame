class Bullet extends Floater {
  private boolean stationary;
  public Bullet(Spaceship astro) {
    myCenterX=astro.getX();
    myCenterY=astro.getY();
    myXspeed=astro.getXspeed();
    myYspeed=astro.getYspeed();
    myPointDirection=astro.getDirection();
    this.accelerate(6.0);
  }
  public Bullet(String n) {
    stationary=true;
  }
  public void show() {
    if (stationary==false) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      strokeWeight(3);
      line((float)myCenterX, (float)myCenterY, (float)(myCenterX+(2*myXspeed)), (float)(myCenterY+(2*myYspeed)));
    }
  }
  public void move () {   //move the floater in the current direction of travel   
    if (stationary==false) {
      //change the x and y coordinates by myXspeed and myYspeed       
      myCenterX += myXspeed;    
      myCenterY += myYspeed;  
      //remove when offscreen 
      if (myCenterX > width) {
        shots.remove(this);
      } else if (myCenterX<0) {
        shots.remove(this);
      }    
      if (myCenterY > height) {
        shots.remove(this);
      } else if (myCenterY < 0) {
        shots.remove(this);
      }
    }
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public void setPos(double x, double y) {
    myCenterX=x;
    myCenterY=y;
  }
}
