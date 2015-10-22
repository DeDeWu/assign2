//You should implement your assign2 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;
int gameState;

PImage start1, start2;
PImage ship, enemy, hp, treasure, bg1, bg2;
PImage end1, end2;
int enemyX, treasureX,treasureY, back1X, back2X, hpX;

float shipX, shipY;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

// boolean isPlaying = false;

void setup () {
  size(640, 480);
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");

  gameState = GAME_START;
  
  shipX = 580;
  shipY = 240;
  enemyX = 0;
  treasureX = floor(random(600));
  treasureY = floor(random(440));
  back1X = 0;
  back2X = 640;
  hpX = floor(random(190));
  ship = loadImage("img/fighter.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
}

void draw() {

  // rect(209,380,240,30);
  switch (gameState){
    case GAME_START:
      image(start2,0,0);
      if (mouseX >= 209 && mouseY >= 380){
        if (mouseX <= 450 && mouseY <= 410){
          image(start1,0,0);
          if (mousePressed){
            gameState = GAME_RUN;
          }
        } 
      }
      break;
    case GAME_RUN:
      // isPlaying = !isPlaying;
      if (upPressed) {
        shipY -= speed;
      }
      if (downPressed) {
        shipY += speed;
      }
      if (leftPressed) {
        shipX -= speed;
      }
      if (rightPressed) {
        shipX += speed;
      }
      if (shipX > 590){
        shipX = 590;
      }
      if (shipX < 0){
        shipX = 0;
      }
      if (shipY > 430){
        shipY = 430;
      }
      if (shipY < 0){
        shipY = 0;
      } 

      image(bg1,back1X,0);
      image(bg2,back2X,0);
      image(ship,shipX,shipY);
      image(treasure,treasureX,treasureY);
      image(enemy,enemyX,treasureY);
      
      fill(255,0,0);
      rect(20,0,hpX,20);
      image(hp,10,0);
      
      enemyX += 2;
      enemyX %=width;
      
      back1X -= 1;
      back2X -= 1;
      if(back1X == -640){
        back1X = 640;
      }
      if(back2X == -640){
        back2X = 640;
      }
      //hit enemy
      if (enemyX >= shipX ){

          gameState = GAME_OVER;
        
      }
      //eat treasure
      if (treasureX+20 >= shipX ){
        if (treasureY+20 >= shipY && treasureY <= shipX+30){
          rect(20,0,hpX+20,20);
          
        }
      }
      break;
    // case GAME_WIN:
      // do something
      // break;
    case GAME_OVER:
      image(end2,0,0);
     // rect(209,315,215,30);
      if (mouseX >= 209 && mouseY >= 315){
        if (mouseX <= 425 && mouseY <= 345){
          image(end1,0,0);
          if (mousePressed){
            gameState = GAME_RUN;
          }
        } 
      }
      break;
    }

}
 void mousePressed(){
  shipX = 580;
  shipY = 240;
  enemyX = 0;
  treasureX = floor(random(600));
  treasureY = floor(random(440));
  hpX = floor(random(190));
 }
 void keyPressed(){
  /*  if (key == CODED){
    println(keyCode);
  }*/
  
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
