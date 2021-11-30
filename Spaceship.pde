class Spaceship extends Floater {   
  public Spaceship() {
    corners = 4;
    xCorners = new int[corners];
    xCorners[0] = 16;
    xCorners[1] = -8;
    xCorners[2] = -2;
    xCorners[3] = -8;
    yCorners = new int[corners];
    yCorners[0] = 0;
    yCorners[1] = 8;
    yCorners[2] = 0;
    yCorners[3] = -8;
    myColor = color(255, 255, 255);
    myCenterX = myCenterY = 360;
    myXspeed = myYspeed = 0; 
    myPointDirection = 0;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    translate((float)myCenterX, (float)myCenterY);  
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);

    if (hyperspace==true) {
      noStroke();
      int z=0;
      int g=200;
      while (z<41) {
        fill(112, 231, 255, g);
        ellipse(3, 0, z+(countDown/15), z+(countDown/15));
        z++;
        g-=5;
      }
      stroke(112, 231, 255, countDown+100);
    } else {
      fill(0);
    }
    if (jumping==true) {
      strokeWeight(1);
      line(-10, 10, -1000, 10);
      line(-2, 0, -1000, 0);
      line(-10, -10, -1000, -10);
    }

    stroke(myColor); 
    strokeWeight(2);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    if (accelerating==true) {
      line(-12, -4, -20, -6);
      line(-12, 0, -20, 0);
      line(-12, 4, -20, 6);
    }
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void show (int a)  //Draws the floater at the current position  
  {             
    translate((float)myCenterX, (float)myCenterY);  
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);

    if (hyperspace==true) {
      noStroke();
      int z=0;
      int g=200;
      while (z<41) {
        fill(112, 231, 255, g);
        ellipse(3, 0, z+(countDown/15), z+(countDown/15));
        z++;
        g-=5;
      }
      stroke(112, 231, 255, countDown+100);
    } else {
      fill(0);
    }
    if (jumping==true) {
      strokeWeight(1);
      line(-10, 10, -1000, 10);
      line(-2, 0, -1000, 0);
      line(-10, -10, -1000, -10);
    }

    stroke(myColor); 
    strokeWeight(2);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    line(-2, 0, 16, 0);

    if (accelerating==true) {
      line(-12, -4, -20, -6);
      line(-12, 0, -20, 0);
      line(-12, 4, -20, 6);
    }
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void centerFleet() {
    astro[0].setPos(360, 360);
    astro[1].setPos(410, 360);
    astro[2].setPos(310, 360);
    astro[3].setPos(360, 410);
    astro[4].setPos(360, 310);
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public void setX(int n) {
    myCenterX=n;
  }
  public void setY(int n) {
    myCenterY=n;
  }
  public void setPos(int n, int a) {
    myCenterX=n;
    myCenterY=a;
  }
  public void setXSpeed(double n) {
    myXspeed=n;
  }
  public void setYSpeed(double n) {
    myYspeed=n;
  }
  public void setDirection(double n) {
    myPointDirection=n;
  }
}
