class Ufo {
  
  PImage img;
  PVector loc;
  int tipo, vida;
  float veloc, velocAng, radio, angulo;
 
  public Ufo(int _tipo) {
    loc = new PVector(width/2, height/2);
    radio = 0;
    angulo = 0;
    
    
    if (_tipo == 1) {
      img = loadImage("blopi1.png");
      veloc = 1;
      velocAng = random(-1 * veloc, veloc);
      vida = -20;
    }
    
    else if (_tipo == 2) {
      img = loadImage("blopi2.png");
      veloc = 1.8;
      velocAng = random(-1 * veloc, veloc);
      vida = -25;
    }
    
    else if (_tipo == 3) {
      img = loadImage("flor.png");
      veloc = 1;
      velocAng = random(-1 * veloc, veloc);
      vida = 20;
    }
    
    else if (_tipo == 4) {
      img = loadImage("mosca.png");
      veloc = 2.5;
      velocAng = random(-1 * veloc, veloc);
      angulo = random(0,360);
      vida = -10;
    }    
  }
  
  void dibujar() {
    float escala = map(radio, 0, height/2, 0, 1);
    imageMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    scale(escala);
    rotate(radians(angulo + 90));
    image(img, 0, 0, width/20, width/20);
    popMatrix();
  }
  
  void mover() {
    loc.x = width/2 + cos(radians(angulo)) * radio;
    loc.y = height/2 + sin(radians(angulo)) * radio;
    
    radio +=veloc;
    angulo +=velocAng;
    
    if (loc.x < 0 || loc.y > width || loc.y < 0 || loc.y > height) {
      loc.set(width/2, height/2);
      radio = 0;  
    }  
  }

  void moverRecto() {
    loc.x = width/2 + cos(radians(angulo)) * radio;
    loc.y = height/2 + sin(radians(angulo)) * radio;
    
    radio +=veloc;
    
    if (loc.x < 0 || loc.y > width || loc.y < 0 || loc.y > height) {
      loc.set(width/2, height/2);
      radio = 0;  
    }  
  }
  
  PVector getPos(){
    return loc;
  }
  
  int getVida(){
    return vida;  
  }
}
