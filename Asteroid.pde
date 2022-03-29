class Asteroid extends Floater {
  private double rotSpeed;
  private int asteroidConstant, myType, myExplosionSize;
  private boolean myExplosionGrow, exploding;
  public Asteroid() {
    rotSpeed=(Math.random()*5)-3;
    asteroidConstant=(int)(Math.random()*15)+5;
    myCenterX=myCenterY=(Math.random()*721)-360;
    myPointDirection=Math.random()*360;
    myExplosionSize=1;
    myExplosionGrow=true;
    exploding=false;
    myColor=255;
    if (Math.random() < 0.5) {
      corners = 10;
      int[] xPoint = {5, 9, 15, 19, 8, 3, -8, -15, -18, -9};
      int[] yPoint = {15, 9, 8, -1, -17, -20, -19, -16, 4, 18};
      xCorners = xPoint;
      yCorners = yPoint;
    } else {
      corners = 18;
      int[] xPoint = {6, 14, 16, 11, 8, -2, -5, -3, -5, -7, -15, -17, -18, -17, -11, -9, -5, -4};
      int[] yPoint = {15, 8, 0, -2, -17, -18, -15, -11, -9, -12, -11, -3, 6, 13, 14, 15, 17, 16};
      xCorners = xPoint;
      yCorners = yPoint;
    }
  }
  public void destroy() {
    fill(255, 0, 0);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, myExplosionSize, myExplosionSize);
    if (myExplosionSize<=50&&myExplosionGrow==true) {
      myExplosionSize+=15;
    } else if (myExplosionSize>=10) {
      myExplosionGrow=false;
      myExplosionSize-=10;
    }
    if (myExplosionSize<=6) {
      exploding=false;
      asteroids.remove(this);
    }
  }
  public void move () {//move the floater in the current direction of travel    
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
    myPointDirection+=rotSpeed;
    //wrap around screen    
    if (myCenterX > width) {
      myCenterX = 0;
    } else if (myCenterX<0) {
      myCenterX = width;
    }    
    if (myCenterY >height) {
      myCenterY = 0;
    } else if (myCenterY < 0) {
      myCenterY = height;
    }
  }   
  public void dropItem() {
    if (myType==1) {
      myType+=(int)(Math.random()*3);
    }
    if (myType==1) {
      countDeathRay++;
    } else if (myType==2) {
      countQuantumFuel++;
    } else if (myType==3) {
      countRepairKit++;
    }
  }
  public void setPos(int x, int y) {
    myCenterX=x;
    myCenterY=y;
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public void setType(double a) {//set asteroid type for powerup drop
    if (a>0.94) {
      myType=1;
    } else {
      myType=0;
    }
  }
  public int getType() {
    return myType;
  }
  public boolean getExploding() {
    return exploding;
  }
  public void explode() {
    exploding=true;
  }
}
