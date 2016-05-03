//Minim Library for music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
float rx;
float ry;

boolean right = false;
boolean left = false;
boolean isInCircle = false;

PVector randomPoint(float radius, float angle) {
  float x = radius * cos(angle);
  float y = radius * sin(angle);
 //Random x
 rx = x;
 //random Y
 ry = y;
  return new PVector(x, y);
}

//values that will be used later in the code
//Disregard int XX and int YY
float change = 3;
float angle = 270;

float radius = 63;
int timeSinceDirectionSwap = 0;
int lvl;
float circleX = cos(radians(angle)) * radius;
float circleY = sin(radians(angle)) * radius;
int death = 1;
int score = 0;
int highscore;

PVector yellowPos;
PVector pinkPos;


//boolean for random points on the circle
boolean firstNumber = true;

//Minim Setup
Minim minim;//audio context
AudioPlayer player;
AudioInput input;
AudioPlayer song;

void setup() {

  yellowPos = new PVector(0.0, 0.0);
  pinkPos = new PVector(0.0, 0.0);
  yellowPos = randomPoint(radius, random(360));

  //
  size(400, 600);
  smooth();

  //Start menu level-
  lvl = 1;

  //Playing the Spy Hunter song
  minim = new Minim(this);
  input = minim.getLineIn();
  song = minim.loadFile("We're all under the stars.mp3");
  song.play();
}

void draw() {
  ellipseMode(CENTER);
  //startmenu
  if (lvl == 1) { 
    //background
    noStroke();
    fill(#64E5B0);

    //top part of the lock
    rect(0, 0, 400, 600);
    fill(70);
    arc(200, 203, 126, 200, radians(180), radians(360));
    fill(#63efb5);
    arc(200, 220, 102, 196, radians(180), radians(360));

    //middle part of the lock
    fill(0);
    ellipse(200, 245, 150, 150);
    fill(#64E5B0);
    ellipse(200, 245, 100, 100);

    //background
    noStroke();
    fill(#64E5B0);

    //top part of the lock
    rect(0, 0, 400, 600);
    fill(70);
    arc(200, 203, 126, 200, radians(180), radians(360));
    fill(#63efb5);
    arc(200, 220, 102, 196, radians(180), radians(360));

    //middle part of the lock
    fill(0);
    ellipse(200, 245, 150, 150);
    fill(#64E5B0);
    ellipse(200, 245, 100, 100);

    //Title
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("Pop The Lock!", 200, 45);

    //Subtitle
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("Press S to Start!", 200, 80);

    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("Press esc to Quit!", 200, 500);
  }
  //game itself
  else if (lvl == 2) {
    //background
    noStroke();
    fill(#64E5B0);

    //top part of the lock
    rect(0, 0, 400, 600);
    fill(70);
    arc(200, 203, 126, 200, radians(180), radians(360));
    fill(#63efb5);
    arc(200, 220, 102, 196, radians(180), radians(360));

    //middle part of the lock
    fill(0);
    ellipse(200, 245, 150, 150);
    fill(#64E5B0);
    ellipse(200, 245, 100, 100);

    //background
    noStroke();
    fill(#64E5B0);

    //top part of the lock
    rect(0, 0, 400, 600);
    fill(70);
    arc(200, 203, 126, 200, radians(180), radians(360));
    fill(#63efb5);
    arc(200, 220, 102, 196, radians(180), radians(360));

    //middle part of the lock
    fill(0);
    ellipse(200, 245, 150, 150);
    fill(#64E5B0);
    ellipse(200, 245, 100, 100);

    //setting the origin in the middle
    translate(200, 245);

    //Move the circle using a timer

    angle+=change;
    fill(0);
    pinkPos.set(cos(radians(angle)) * radius, sin(radians(angle)) * radius);

    fill(#FF6A6A);
    ellipse(pinkPos.x, pinkPos.y, 24, 24);
    timeSinceDirectionSwap ++;
  }

  if ((lvl == 2)&&(firstNumber == true)) {
    // yellow circle
    fill(#E9FF48);
    ellipse(yellowPos.x, yellowPos.y, 24, 24);
  }

  ////Hit detection
  //if (( angle >= circleX) && (angle >= circleY) && (lvl == 2)) {
  //  text("test", 30, 30);
  //  score+=1;
  //  fill(0);
  //  //highscore = max(score, highscore);
  //  //textSize(45);
  //  //text(""+score, 0, 10);
  //  randomPoint(radius, random(360));
  //} else if (( angle <= circleX) && (angle <= circleY) && (lvl == 2)) {
  //  textSize(10);
  //  text("you died", 30, 30);
  //}
  
  if(pinkPos.x > yellowPos.x -24 && pinkPos.x < yellowPos.x + 24 && pinkPos.y > yellowPos.y - 24 && pinkPos.y < yellowPos.y + 24 && !isInCircle)
  {
    isInCircle = true;
    
    if(change == 3)right = true;
    if(change == -3)left = true;
  }else if(isInCircle && !(pinkPos.x > yellowPos.x -24 && pinkPos.x < yellowPos.x + 24 && pinkPos.y > yellowPos.y - 24 && pinkPos.y < yellowPos.y + 24))
  {
    println(change);
    println(left);
    if((change == 3 && left) || (change == -3 && right))
    {
       yellowPos = randomPoint(radius, random(360));
    }
    else noLoop();
    
    right = false;
    left = false;
    
    isInCircle = false;
    
  }
  
  
}

//keypressed functions
void keyPressed() {
  if (key == 'f' && timeSinceDirectionSwap >= 19) {
    
    
    change *= -1;
    timeSinceDirectionSwap = 0;
  } else if (key == 's') {
    lvl = 2;
  } else if (key == 'S') {
  } else if (key == 'r') {
    lvl = 1;
  }
}