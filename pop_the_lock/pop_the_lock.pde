//values that will be used later in the code
float angle = 1;
float change = 0;
float radius = 63;
void setup() {
  size(400, 600);
  smooth();
}

void draw() {

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

  //If statement in order to get it to move in the opposite direction
  if (keyPressed) {
    if (key == 'f' || key == 'f') {
      fill(#FF6A6A);
      fill(#FF6A6A);
      float x = cos(radians(change+=angle)) * radius;
      float y = sin(radians(change+=angle)) * radius;
      ellipse(x, y, 24, 24);
    }
  } else {
    fill(#FF6A6A);
    float x = cos(radians(change-=angle)) * radius;
    float y = sin(radians(change-=angle)) * radius;
    ellipse(x, y, 24, 24);
  }
}