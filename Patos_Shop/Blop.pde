//class Blop {
  
//  PImage imageBlop;
//  float angRotacion;
//  int vida;
//  long instanteEscupa;
//  int intervaloEscupa;
//  //ArrayList<BalaBoss> balas;

//  public Blop() {
//    imageBlop = loadImage("Blop_00001.png");
//    balas = new ArrayList<BalaBoss>();
//    reset();
//  }
  
//  void reset() {
//    vida = 30;
//    angRotacion = 90;
//    balas.clear();
//    instanteEscupa = millis();
//    intervaloEscupa = 1000;
//  }
  
//  void dibujar() {
//    imageMode(CENTER);
//    image(imageBlop, width/2, height/2);
//    //pushMatrix();
//    //translate(width/2, height/2);
//    //rotate(radians(angRotacion));
//    //image(img,0,0);
//    //popMatrix();
    
//    //dibuja las balas
//    for (int x=0; x<balas.size(); x++) {
//      BalaBoss aux = balas.get(x);
//      aux.mover();
//      aux.dibujar();
      
//      if (!aux.isPlaying())
//        balas.remove(x);
//    }
//  }
  
//  void mover() {
//    //loc.x = width/2 + cos(radians(angulo)) * radio;
//    //loc.y = height/2 + sin(radians(angulo)) * radio;
    
//    //angRotacion += 0.5;
//  }
  
//  void disparar() {
//    if (millis() - instanteEscupa > intervaloEscupa) {
//      instanteEscupa = millis();
//      if (vida > 15) {
//        float angTmp = random(0,360);
//        BalaBoss nueva1 = new BalaBoss(angTmp);
//        BalaBoss nueva2 = new BalaBoss(angTmp+180);
//        balas.add(nueva1);
//        balas.add(nueva2);
//      }
//      else {
//        BalaBoss nueva1 = new BalaBoss(random(0,360));
//        BalaBoss nueva2 = new BalaBoss(random(0,360));
//        balas.add(nueva1);
//        balas.add(nueva2);
//      }
//    }
//  }
  
//  boolean balaJefe(PVector pos) {
//    for (int x=0; x<balas.size(); x++) {
//      BalaBoss aux = balas.get(x);
//      if (aux.getPos().dist(pos) < 15) {
//        aux.quitarBala();
//        return true;
//      }
//    }
//    return false;
//  }
  
//  void quitarVida() {
//    vida -= 1;
//    intervaloEscupa -= 70;
//  }
  
//  int getVida() {
//    return vida;
//  }
//}*/
