class Pato {

  PImage img;
  PVector loc;
  float x, y, vel, ang;
  int vida, puntos;
  ArrayList<AtaquePato> ataques;
  
  public Pato() {
    reinicio();
    img = loadImage("patosuperior.png");
    ataques = new ArrayList<AtaquePato>();
    loc = new PVector();
  }
  
  void reinicio() {
    ang = 90;
    vel = 0;
    vida = 100;
    puntos = 0;
//    ataques.clear();
  }
  
  int getPuntaje() {
    return puntos;
  
  }
  
  void dibujar() {
    ang += vel;
    loc.x = width/2 + cos(radians(ang)) * width/5;
    loc.y = height/2 + sin(radians(ang)) * width/5;
    
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(ang - 90));
    imageMode(CENTER);
    image(img, 0, 0);
    popMatrix();
    
    for (int x=0; x < ataques.size(); x++) {
      AtaquePato aux = ataques.get(x);
      aux.mover();
      aux.dibujar();
      
      if (!aux.isPlaying())
        ataques.remove(x);
    }
  }
  
  void disparar () {
    AtaquePato nuevo = new AtaquePato(ang, 180);
    ataques.add(nuevo);  
  }
  
  boolean balaBlopi(PVector posBlopi) {
    for (int x=0; x < ataques.size(); x++) {
      AtaquePato aux = ataques.get(x);
      if (aux.getPos().dist(posBlopi) < 15) {
        ataques.remove(x);
        puntos+=100;
        return true;
      }
    }
    return false;
  }
  
  void quitarVida() {
    vida -= 20;
  }
  
  boolean estaVivo() {
    if (vida > 0)
      return true;
    return false;
  } 
  
  void movD() {
    vel = -2;
  }
  
  void movI() {
    vel = 2;
  }
  
  void noMov() {
    vel = 0;
  }
  
  PVector getPos() {
    return loc;
  }
}
