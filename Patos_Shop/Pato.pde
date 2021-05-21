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
  }
  
  int getPuntaje() {
    return puntos;
  
  }
  
  void dibujar() {
    ang += vel;
    loc.x = width/2 + cos(radians(ang)) * (width/4 - width/50);
    loc.y = height/2 + sin(radians(ang)) * (width/4 - width/50);
    
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(ang - 90));
    imageMode(CENTER);
    image(img, 0, 0, width/20, width/20);
    popMatrix();
    
    for (int x=0; x < ataques.size(); x++) {
      AtaquePato aux = ataques.get(x);
      aux.mover();
      aux.dibujar();
      
      if (!aux.isPlaying())
        ataques.remove(x);
    }
    
    textSize(15);
    fill(255);
    textAlign(LEFT);
    text("Condicion: "+vida+"%", 20,20);
    
    textAlign(RIGHT);
    text("Puntos: "+puntos, width-20, 20);
  }
  
  void disparar () {
    AtaquePato nuevo = new AtaquePato(ang, width/4 - width/20);
    ataques.add(nuevo);  
  }
  
  boolean ataque(PVector posUfo) {
    for (int x=0; x < ataques.size(); x++) {
      AtaquePato aux = ataques.get(x);
      if (aux.getPos().dist(posUfo) < width/80) {
        ataques.remove(x);
        puntos+=100;
        return true;
      }
    }
    return false;
  }
  
  void sumarVida(int _vida) {
    vida += _vida;
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
