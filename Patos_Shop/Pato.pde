class Pato {

  PImage img;
  float x, y, vel, ang;
  
  public Pato() {
    reinicio();
    img = loadImage("patosuperior.png");
  }
  
  void reinicio() {
    ang = 87;
    vel = 0;
  }
  
  void dibujar() {
    ang += vel;
    translate(width/2, height/2);    
    rotate(radians(radians(ang) * width/5));
    image(img, width/5, height/5, width/20, width/20);
    
  }
  
  void movD() {
    vel = -0.3;
  }
  
  void movI() {
    vel = 0.3;
  }
  
  void noMov() {
    vel = 0;
  }
}
