//Minim Library for music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage startmenu;

//values that will be used later in the code
float change = 2;
float angle = 0;
float radius = 63;
int timeSinceDirectionSwap = 0;
int lvl;

//Minim Setup
Minim minim;//audio context
AudioPlayer player;
AudioInput input;
AudioPlayer song;

void setup() {
  size(400, 600);
  smooth();

  //Start menu level
  lvl = 1;

  //Playing the Spy Hunter song
  minim = new Minim(this);
  input = minim.getLineIn();
  song = minim.loadFile("We're all under the stars.mp3");
  song.play();
}

void draw() {
  //startmenu
  if (lvl == 1) { 
    //background
    noStroke();
    fill(#64E5B0);
    textSize(50);
    text("Pop The Lock!", 10, 30);

    ////top part of the lock
    //rect(0, 0, 400, 600);
    //fill(70);
    //arc(200, 203, 126, 200, radians(180), radians(360));
    //fill(#63efb5);
    //arc(200, 220, 102, 196, radians(180), radians(360));

    ////middle part of the lock
    //fill(0);
    //ellipse(200, 245, 150, 150);
    //fill(#64E5B0);
    //ellipse(200, 245, 100, 100);

    ////background
    //noStroke();
    //fill(#64E5B0);

    ////top part of the lock
    //rect(0, 0, 400, 600);
    //fill(70);
    //arc(200, 203, 126, 200, radians(180), radians(360));
    //fill(#63efb5);
    //arc(200, 220, 102, 196, radians(180), radians(360));

    ////middle part of the lock
    //fill(0);
    //ellipse(200, 245, 150, 150);
    //fill(#64E5B0);
    //ellipse(200, 245, 100, 100);
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

    //marker revolving around the lock

    //Move the circle
    angle+=change;
    fill(0);
    float x = cos(radians(angle)) * radius;
    float y = sin(radians(angle)) * radius;
    fill(#FF6A6A);
    ellipse(x, y, 24, 24);

    timeSinceDirectionSwap ++;
  }
}


void keyPressed() {
  if (key == 'f' && timeSinceDirectionSwap >= 19) {
    change *= -1;
    timeSinceDirectionSwap = 0;
  } else if (key == 's') {
    lvl+=1;
  }
}