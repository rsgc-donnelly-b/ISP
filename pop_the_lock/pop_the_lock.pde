//Minim Library for music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PVector randomPoint(float radius, float angle) {
  float x = radius * cos(angle);
  float y = radius * sin(angle);

  return new PVector(x, y);
}

//values that will be used later in the code
float change = 3;
float angle = 0;
float radius = 63;
int timeSinceDirectionSwap = 0;
int lvl;
float circleX = cos(radians(angle)) * radius;
float circleY = sin(radians(angle)) * radius;
int markerX = width; 
int markerY = height;
int death = 1;
int score = 0;
int highscore;

PVector pos;

//boolean for random points on the circle
boolean firstNumber = true;

//Minim Setup
Minim minim;//audio context
AudioPlayer player;
AudioInput input;
AudioPlayer song;

void setup() {
  pos = randomPoint(radius, random(360));

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
    float circleX = cos(radians(angle)) * radius;
    float circleY = sin(radians(angle)) * radius;
    fill(#FF6A6A);
    ellipse(circleX, circleY, 24, 24);
    timeSinceDirectionSwap ++;
  }

  if (firstNumber == false) {
  }

  if ((lvl == 2)&&(firstNumber == true)) {

    fill(#E9FF48);
    ellipse(pos.x, pos.y, 24, 24);
  }
  if ((sqrt(sq((pos.x - 30 - 15) - circleX) + sq((pos.y - 40 - 15) - circleY))) < 35)

  {
   //stops it from continuing to draw
   noLoop();
  }
  if ((circleX == pos.x) && (circleY == pos.y)) {
    score+=1;
    fill(0);
    highscore = max(score, highscore);
    text(""+score, 30, 30);
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
  } else if (key == 'R') {
  } else if (key == 'd') {
  }
}