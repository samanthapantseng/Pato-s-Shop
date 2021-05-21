class AtaquePato {
  
  PImage img;
  PVector loc;
  float angulo, radio, dif;
  boolean isAlive;
  
  public AtaquePato(float _ang, float _rad) {
    img = loadImage("burbuja.png");
    angulo = _ang;
    radio = _rad;
    dif = radio;
    loc = new PVector();
    isAlive = true;
  }
  
  void dibujar() {
    float escala = map(radio, dif, 0, 1, 0);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    scale(escala);
    image(img, 0, 0);
    popMatrix();
  }
  
  void mover() {
    loc.x = width/2 + cos(radians(angulo)) * radio;
    loc.y = height/2 + sin(radians(angulo)) * radio;
    
    radio -=2;
    
    if (dist(loc.x, loc.y, width/2, height/2) < 20)
      isAlive = false; 
  }
  
  PVector getPos() {
    return loc;
  }
  
  boolean isPlaying() {
    return isAlive;
  }
}
