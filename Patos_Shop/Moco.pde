class Moco {
  
  PVector pos;
  PVector vel;
  color clr;
  
  public Moco() {    
    pos = new PVector(width/2, height/2);    
    vel = new PVector(random(-5,5), random(-5,5));   
    clr = color(random(0,100), random(80,100), random(60,80));
  }

  void dibujar() {
    noStroke();
    fill(clr);
    square(pos.x, pos.y, width/312);
  }
  
  void mover() {
    pos.add(vel);    
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      pos.set(width/2, height/2);
      vel.set(random(-5,5), random(-5,5));
    }
  }
}
