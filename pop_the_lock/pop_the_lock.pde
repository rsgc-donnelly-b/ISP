//values that will be used later in the code
float change = 1;
float angle = 0;
float radius = 63;
int timeSinceDirectionSwap = 0;
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

  //Move the circle
  float x = cos(radians(angle+=change)) * radius;
  float y = sin(radians(angle+=change)) * radius;
  fill(#FF6A6A);
  ellipse(x, y, 24, 24);
  
  timeSinceDirectionSwap ++;

  //If statement in order to get it to move in the opposite direction
  if (keyPressed) {
    if (key == 'f' && timeSinceDirectionSwap >= 19) {
      change *= -1;
      timeSinceDirectionSwap = 0;
    }
  }
}