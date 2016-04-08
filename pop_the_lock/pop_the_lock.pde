//values that will be used later in the code
float radius = 70;
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

  translate(200, 245);
  
  fill(0);
  ellipse(0, 0, 5, 5);

  //marker revolving around the lock
  fill(#FF6A6A);
  float x = cos(radians(frameCount)) * radius;
  float y = sin(radians(frameCount)) * radius;
  ellipse(x, y, 10, 10);
}