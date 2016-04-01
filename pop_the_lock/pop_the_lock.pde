void setup() {
  size(400, 600);
}

void draw() {

  //background

  noStroke();
  fill(#64E5B0);

  //top part of the lock
  rect(0, 0, 400, 600);
  fill(70);
  arc(200, 200, 119, 196, radians(180), radians(360));
  fill(#64E5B0);
  arc(200, 220, 102, 196, radians(180), radians(360));
  
  //middle part of the lock
  fill(0);
  ellipse(200, 245, 150, 150);
  fill(#64E5B0);
  ellipse(200, 245, 100, 100);
}