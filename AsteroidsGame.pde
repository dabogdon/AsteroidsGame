Star[] bob = new Star[200];
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
Spaceship astro = new Spaceship();

boolean accelerating = false;
boolean left = false;
boolean right = false;
boolean hyperspace = false;
boolean jumping = false;

int countDown = 0;
int asteroidCount=(int)(Math.random()*6)+4;

public void setup() {
  size(720, 720);
  background(0);
  //stars
  for (int i=0; i<bob.length; i++) {
    bob[i]=new Star();
  }
  //asteroids
  for (int i=0; i<asteroidCount; i++) {
    Asteroid joe = new Asteroid();
    asteroids.add(joe);
    asteroids.get(i).accelerate(Math.random()*2);
    asteroids.get(i).setPos((int)(Math.random()*721)-360, (int)(Math.random()*721)-360);
  }
}

public void draw() {
  background(0);
  //framerate
  textSize(20);
  fill(255);
  text((int)(frameRate), 5, 23);  
  for (int i=0; i<bob.length; i++) {//stars
    bob[i].show();
  }
  for (int i=0; i<asteroids.size(); i++) {//asteroids
    asteroids.get(i).show();
    asteroids.get(i).move();
    if (dist((float)astro.getX(), (float)astro.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY())<=25) {
      asteroids.remove(i);
    }
  }
  if (hyperspace==true&&countDown<180) {//hyperspace countdown
    countDown+=1;
  }

  //spaceship functions
  astro.show();
  astro.move();
  if (hyperspace==false) {//allow movement if not hyperspacing
    if (accelerating == true)
      astro.accelerate(.1);
    if (left == true)
      astro.turn(-5);
    if (right == true)
      astro.turn(5);
  }
  if (hyperspace==true&&countDown==180) {//jump to hyperspace
    astro.accelerate(5);
    jumping = true;
    if (astro.getX()>=width||astro.getX()<=0||astro.getY()>=height||astro.getY()<=0) {//end hyperspace when spaceship leaves screen

      jumping = false;

      for (int i=0; i<bob.length; i++) {//set new stars
        bob[i]=new Star();
      }
      //reset asterodis
      asteroids.clear();
      spawnAsteroids();
      //respawn ship
      astro.setXSpeed(0);
      astro.setYSpeed(0);
      astro.setX((int)(Math.random()*700));
      astro.setY((int)(Math.random()*700));
      astro.setDirection(Math.random()*360);
      hyperspace=false;
      countDown=0;
    }
  }
}

public void keyPressed() {
  if (keyCode == 87) 
    accelerating = true;
  if (keyCode == 65) 
    left = true;
  if (keyCode == 68) 
    right = true;
  if (keyCode == 32) {
    hyperspace=true;
  }
}
public void keyReleased()
{
  if (keyCode == 87) accelerating = false;
  if (keyCode == 65) left = false;
  if (keyCode == 68) right = false;
}

public void spawnAsteroids() {
  asteroidCount=(int)(Math.random()*6)+4;
  for (int i=0; i<asteroidCount; i++) {
    Asteroid joe = new Asteroid();
    asteroids.add(joe);
    asteroids.get(i).accelerate(Math.random()*2);
    asteroids.get(i).setPos((int)(Math.random()*721)-360, (int)(Math.random()*721)-360);
  }
}
