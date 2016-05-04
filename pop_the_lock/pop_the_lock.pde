pause pauseMenu;
//Minim Library for music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
float rx;
float ry;
PShader blur;

boolean right = false;
boolean left = false;
boolean isInCircle = false;

//pause menu
boolean pauseBoolean = false;

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
  frameRate(60);

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

    //Ellipse at the starting point
    fill(#FF6A6A);
    ellipse(200, 182, 24, 24);

    //Title
    fill(0);
    textAlign(CENTER);
    textSize(27);
    text("POP THE LOCK! HARD MODE!", 200, 45);

    //Subtitle
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("Press S to Start!", 200, 80);
    text("Press P for controls and Credits!", 200, 430);
    textSize(70);
    text("0", 201, 265);

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

    //Points going up
    fill(0);
    textSize(70);
    text(""+score, 0, 20);
  }
  if ((pauseBoolean == true) && (lvl == 1)) {
    fill(#54B28A, 100);
    rect(45, 100, 320, 410);
    fill(0);
    textSize(20);
    text("Controls", 200, 130);
    textSize(12);
    text("Space moves the pink circle back and forth", 200, 150);
    textSize(20);
    text("Credits", 200, 190);
    text("reddit.com/u/nicowesse", 200, 210);
    text(" Mr. Gordon", 200, 230);
    text("Logush", 200, 250);
  }

  if ((lvl == 2)&&(firstNumber == true)) {
    // yellow circle
    fill(#E9FF48);
    ellipse(yellowPos.x, yellowPos.y, 24, 24);
  }

  if (pinkPos.x > yellowPos.x -24 && pinkPos.x < yellowPos.x + 24 && pinkPos.y > yellowPos.y - 24 && pinkPos.y < yellowPos.y + 24 && !isInCircle)
  {
    isInCircle = true;

    if (change == 3)right = true;
    if (change == -3)left = true;
  } else if (isInCircle && !(pinkPos.x > yellowPos.x -24 && pinkPos.x < yellowPos.x + 24 && pinkPos.y > yellowPos.y - 24 && pinkPos.y < yellowPos.y + 24))
  {
    println(change);
    println(left);
    if ((change == 3 && left) || (change == -3 && right))
    {
      yellowPos = randomPoint(radius, random(360));
      score+=1;
    } else noLoop();
    right = false;
    left = false;
    isInCircle = false;
  }
}

//keypressed functions
void keyPressed() {
  if (key == ' ' && timeSinceDirectionSwap >= 19) {


    change *= -1;
    timeSinceDirectionSwap = 0;
  } else if (key == 's') {
    lvl = 2;
  } else if (key == 'r') {
    loop();
    lvl=1;
    score = 0;
    randomPoint(radius, random(360));
    angle = 270;
    change = 3;
    song.play();
  } //else if (key == 'p') { // pause key
  //  pauseMenu.display();
  //}
  if (key == 'p') {
    if (pauseBoolean == false) {
      pauseBoolean = true;
    } else {
      pauseBoolean = false;
    }
  }
}