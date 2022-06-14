//class definitions
Star[] bob = new Star[200];
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
Spaceship astro = new Spaceship();
//background booleans
boolean accelerating = false;
boolean left = false;
boolean right = false;
boolean hyperspace = false;
boolean jumping = false;
boolean destroy=false;
boolean explosionGrow=true;
boolean deathRay=false;
//background variables
int countDown = 0;
int asteroidCount=(int)(Math.random()*6)+4;
int spawnRate=0;
int score=0;
float explosionSize=0;
//health
float damageTaken;
float health=100;
//powerups
int countRepairKit=0;
int countQuantumFuel=0;
int countDeathRay=0;
int rayTimer=0;
public void setup() {
  size(720, 720);
  background(0);
  for (int i=0; i<bob.length; i++) {
    bob[i]=new Star();
  } //stars
  for (int i=0; i<asteroidCount; i++) {//asteroids
    Asteroid joe = new Asteroid();
    asteroids.add(joe);
    asteroids.get(i).accelerate(Math.random()*2);
    asteroids.get(i).setPos((int)(Math.random()*721)-360, (int)(Math.random()*721)-360);
    asteroids.get(i).setType(Math.random());
  }
}
public void draw() {
  background(0);
  damageTaken=0;
  if (health<=0) {//death
    destroy=true;
    astro.setXSpeed(0);
    astro.setYSpeed(0);
    astro.destroy();
    health=0;
  }
  addstroids(); //randomly spawn asteroids
  for (int i=0; i<shots.size(); i++) {//show & move bullets
    shots.get(i).show();
    shots.get(i).move();
  }
  for (int i=0; i<bob.length; i++) {
    bob[i].show();
  } //show stars
  for (int i=0; i<asteroids.size(); i++) {//asteroids collision with ship
    if (asteroids.get(i).getExploding()==false) {
      asteroids.get(i).show();
    }
    asteroids.get(i).move();
    if (dist((float)astro.getX(), (float)astro.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY())<=25&&hyperspace==false&&destroy==false&&asteroids.get(i).getExploding()==false) {
      asteroids.remove(i);
      astro.setXSpeed(astro.getXspeed()-astro.getXspeed()*1.3);
      astro.setYSpeed(astro.getYspeed()-astro.getYspeed()*1.3);
      damageTaken=(abs((float)astro.getXspeed())+abs((float)astro.getYspeed())*7)+15;
      health-=damageTaken;
    }
  }
  if (hyperspace==true&&countDown<180) {
    countDown+=1;
  }//hyperspace countdown
  //spaceship functions
  if (destroy==false) {
    astro.show();
    astro.move();
    if (hyperspace==false) {//allow movement if not hyperspacing
      if (accelerating == true) astro.accelerate(.1);
      if (left == true) astro.turn(-5);
      if (right == true) astro.turn(5);
    }
  }
  if (hyperspace==true&&countDown==180) {//jump to hyperspace
    astro.accelerate(3);
    jumping = true;
    if (astro.getX()>=width-20||astro.getX()<=20||astro.getY()>=620||astro.getY()<=10) {//end hyperspace when spaceship leaves screen
      jumping = false;
      for (int i=0; i<bob.length; i++) {
        bob[i]=new Star();
      }//set new stars
      //reset asterodis
      asteroids.clear();
      spawnAsteroids();
      //respawn ship
      astro.setXSpeed(0);
      astro.setYSpeed(0);
      astro.setX((int)(Math.random()*500)+21);
      astro.setY((int)(Math.random()*500)+21);
      astro.setDirection(Math.random()*360);
      hyperspace=false;
      countDown=0;
      //add score
      score+=300;
    }
  }
  for (int j=0; j<shots.size(); j++) { //asteroids collision with bullet
    for (int i=0; i<asteroids.size(); i++) {
      if (dist((float)shots.get(j).getX(), (float)shots.get(j).getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY())<=25&&asteroids.get(i).getExploding()==false) {
        score+=150;
        if (deathRay==false) {
          asteroids.get(i).dropItem();
        }
        asteroids.get(i).explode();
        shots.remove(j);
        break;
      }
    }
  }
  if (rayTimer==0) {
    deathRay=false;
  }
  if (deathRay==true && rayTimer>0) {//deathray powerup
    Bullet j = new Bullet(astro);
    shots.add(j);
    rayTimer--;
  }
  for (int i=0; i<asteroids.size(); i++) {
    if (asteroids.get(i).getExploding()==true) {
      asteroids.get(i).destroy();
    }
  }
  ui();
}
public void keyPressed() {
  if (keyCode == 87) accelerating = true;
  if (keyCode == 65) left = true;
  if (keyCode == 68) right = true;
  if (keyCode ==72 && countQuantumFuel>0 && hyperspace==false && destroy==false) {
    hyperspace=true;
    countQuantumFuel--;
  }
  if (keyCode==81 && countRepairKit>0 && health<100 && destroy==false) {
    while (health<100) {
      health++;
    }
    countRepairKit--;
  }
  if (keyCode==82 && countDeathRay>0 && deathRay==false && destroy==false) {
    if (countDeathRay>0) {
      deathRay=true;
      rayTimer=1200;
      countDeathRay--;
    }
  }
}
public void keyReleased() {
  if (keyCode == 87) accelerating = false;
  if (keyCode == 65) left = false;
  if (keyCode == 68) right = false;
}
public void mousePressed() {
  if (hyperspace==false && destroy==false) {
    Bullet j = new Bullet(astro);
    shots.add(j);
  }
}
public void spawnAsteroids() {
  asteroidCount=(int)(Math.random()*6)+4;
  for (int i=0; i<asteroidCount; i++) {
    Asteroid joe = new Asteroid();
    asteroids.add(joe);
    asteroids.get(i).accelerate(Math.random()*2);
    asteroids.get(i).setPos((int)(Math.random()*721)-360, (int)(Math.random()*721)-360);
    asteroids.get(i).setType(Math.random());
  }
}
public void addstroids() {
  if (Math.random()>0.96) {
    Asteroid joe = new Asteroid();
    asteroids.add(joe);
    asteroids.get(asteroids.size()-1).accelerate(Math.random()*2);
    asteroids.get(asteroids.size()-1).setPos((int)(Math.random()*721)-360, (int)(Math.random()*721)-360);
    asteroids.get(asteroids.size()-1).setType(Math.random());
  }
}
public void ui() {
  noFill();
  stroke(255);
  rect(20, 20, 680, 600);
  fill(0, 0, 255);
  noStroke();
  rect(0, 0, 720, 20);
  rect(0, 0, 20, 720);
  rect(701, 0, 20, 720);
  rect(0, 621, 720, 300);
  stroke(255);
  fill(0);
  strokeWeight(2);
  rect(175, 630, 150, 35);
  rect(420, 630, 150, 35);
  for (int x=10; x<550; x+=240) {
    rect(x, 675, 220, 35);
  }
  textSize(20);
  fill(255);
  text("Health: "+(int)health, 183, 655);  
  text("Score: "+score, 428, 655);
  text("Repair Kit (Q): "+countRepairKit, 258, 700);
  text("Quantum Fuel (H): "+countQuantumFuel, 498, 700);
  text("Gattling Gun (R): "+countDeathRay, 18, 700);
}
