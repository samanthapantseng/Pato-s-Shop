//class Escupa {
  
//  PImage imgEscupa;
//  PVector position;
//  int vida;
//  float veloc, radio, angulo;
//  boolean isAlive;
 
//  public Escupa(float _ang) {
//    imgEscupa = loadImage("escupa.png");
//    position = new PVector(width/2, height/2);
//    //radio = _rad;
//    veloc = random(-1, 1);
    
//    angulo = _ang;
//    isAlive = true;
//    vida = -15;
     
//  }
  
//  void dibujar() {
//    float escala = map(radio, 0, height/2, 0, 1);
//    imageMode(CENTER);
//    pushMatrix();
//    translate(position.x, position.y);
//    scale(escala);
//    rotate(radians(angulo + 90));
//    image(imgEscupa, 0, 0, width/10, width/10);
//    popMatrix();
//  }
  
 

//  void mover() {
//    position.x = width/2 + cos(radians(angulo)) * radio;
//    position.y = height/2 + sin(radians(angulo)) * radio;
    
//    radio +=veloc;
    
//    if (position.x < 0 || position.y > width || position.y < 0 || position.y > height) {
//      isAlive = false;
//      //position.set(width/2, height/2);
//      //radio = 0;  
//    }  
//  }
  
  
//  PVector getPos(){
//    return position;
//  }
  
//  boolean isPlaying() {
//    return isAlive;
//  }
  
//  int getVida(){
//    return vida;  
//  }
  
//  void quitarEscupa() {
//    isAlive = false;
//  }
//}
