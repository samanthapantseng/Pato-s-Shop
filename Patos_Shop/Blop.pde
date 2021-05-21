class Blop {
  
  PImage imageBlop;
  float angRotacion;
  int vida;
  int valorVida;
  long instanteEscupa;
  int intervaloEscupa;
  ArrayList<Escupa> escupas;

  public Blop() {
    imageBlop = loadImage("blop.png");
    escupas = new ArrayList<Escupa>();
    reset();
    valorVida = -15;
  }
  
  void reset() {
    vida = 25;
    angRotacion = 90;
    escupas.clear();
    instanteEscupa = millis();
    intervaloEscupa = 2500;
  }
  
  void dibujar() {
    imageMode(CENTER);
    image(imageBlop, width/2, height/2);

    //dibuja las escupas
    for (int x=0; x<escupas.size(); x++) {
      Escupa aux = escupas.get(x);
      aux.mover();
      aux.dibujar();
      
      if (!aux.isPlaying())
        escupas.remove(x);
    }
  }
    
  void disparar() {
    if ((millis() - instanteEscupa > intervaloEscupa) && escupas.size() < 12) {
      instanteEscupa = millis();
      if (vida > 15) {
        float angTmp = random(0,360);
        Escupa nueva1 = new Escupa(angTmp);
        Escupa nueva2 = new Escupa(angTmp+180);
        escupas.add(nueva1);
        escupas.add(nueva2);
      }
      else {
        Escupa nueva1 = new Escupa(random(0,360));
        Escupa nueva2 = new Escupa(random(0,360));
        escupas.add(nueva1);
        escupas.add(nueva2);
      }
    }
  }
  
  boolean choqueEscupa(PVector pos) {
    for (int x=0; x<escupas.size(); x++) {
      Escupa aux = escupas.get(x);
      if (aux.getPos().dist(pos) < 15) {
        aux.quitarEscupa();
        return true;
      }
    }
    return false;
  }
  
  void quitarVida() {
    if (vida != 0) {
      vida -= 1;    
    }
    intervaloEscupa -= 70;
  }
  
  int getVida() {
    return vida;
  }
  
   int getValorVida() {
    return valorVida;
  }
}
