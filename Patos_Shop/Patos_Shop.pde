import gifAnimation.*;
PImage[] animation;
Gif loopingE1;
Gif loopingE3;
Gif loopingE4;

import ddf.minim.*;
Minim minim;
AudioPlayer mE1, mE2, mE3, mE4;
AudioSample sfxSplash, sfxMosca, sfxMoco, sfxFlor, sfxNivel;

ArrayList<Moco> mocos;
Pato pato;
long instante, instanteRestart;
int n, espera, esperaRestart, escenario;

//nivel
int nivel;
boolean cambioNivel;

//obstaculos
ArrayList<Ufo> moscas;
long instanteMosca;
int intervaloMosca;


//enemigos
ArrayList<Ufo> blopis;
long instanteBlopi;
int intervaloBlopi;

//explosiones
ArrayList<ExplosionMoco> explosionMocos;
ArrayList<ChoqueMosca> choqueMoscas;
ArrayList<Splash> splashes;

//flores
ArrayList<Ufo> flores;
long instanteFlor;
int intervaloFlor;

PFont font;

//blop
//Blop blop;

void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  frameRate(60);

  minim = new Minim(this);
  mE1 = minim.loadFile("mE1.mp3");
  mE2 = minim.loadFile("mE2.mp3");
  mE3 = minim.loadFile("mE3.mp3");
  mE4 = minim.loadFile("mE4.mp3");  
  
  sfxSplash = minim.loadSample("sfxSplash.mp3");
  sfxMoco = minim.loadSample("sfxMoco.mp3");
  sfxMosca = minim.loadSample("sfxMosca.mp3");
  sfxFlor = minim.loadSample("sfxFlor.mp3");
  sfxNivel = minim.loadSample("sfxNivel.mp3");
  
  mE1.play();
  mE1.loop();

  loopingE1 = new Gif(this, "loopingE1.gif");
  loopingE3 = new Gif(this, "loopingE3.gif");
  loopingE4 = new Gif(this, "loopingE4.gif");

  instante = millis();

  n = 0;
  mocos = new ArrayList<Moco>();
  blopis = new ArrayList<Ufo>();
  moscas = new ArrayList<Ufo>();

  explosionMocos = new ArrayList<ExplosionMoco>();
  choqueMoscas = new ArrayList<ChoqueMosca>();
  splashes = new ArrayList<Splash>();

  flores = new ArrayList<Ufo>();
  pato = new Pato();
  //blop = new Blop();

  escenario = 1;
  esperaRestart = 8000;
  
  font = createFont("patotype.ttf", width/50);
  textFont(font);
}

void draw() {
  background(#FFFBED);

  if (escenario == 1)
    escenario1();
  else if (escenario == 2)
    escenario2();
  else if (escenario == 3)
    escenario3();
  else if (escenario == 4)
    escenario4();
}

void escenario1() {
  loopingE1.loop();
  image(loopingE1, width/2, height/2, width, height);
}

void escenario2() {

  //mocos
  if (millis() - instante > espera && n<150) {
    Moco nuevo = new Moco();
    mocos.add(nuevo);
    n ++;
  }

  for (int x=0; x < mocos.size(); x++){
    Moco tmp = mocos.get(x);
    tmp.dibujar();
    tmp.mover();
  }

  //moscas
  for (int x=0; x < moscas.size(); x++) {
    Ufo aux = moscas.get(x);
    aux.moverRecto();
    aux.dibujar();

    if (pato.getPos().dist(aux.getPos()) < width/30) {
      choqueMoscas.add(new ChoqueMosca(aux.getPos()));
      sfxMosca.trigger();      
      pato.sumarVida(aux.getVida());
      moscas.remove(x);
    }
  }

  if (millis() - instanteMosca > intervaloMosca) {
    Ufo nuevo = new Ufo(4);
    moscas.add(nuevo);   
    instanteMosca = millis();

  }
  //flores
  for (int x=0; x < flores.size(); x++) {
    Ufo aux = flores.get(x);
    aux.mover();
    aux.dibujar();

    if (pato.getPos().dist(aux.getPos()) < width/30) {
      sfxFlor.trigger();
      pato.sumarVida(aux.getVida());
      flores.remove(x);
      comeVida.trigger();
    }
  }

  if (millis() - instanteFlor > intervaloFlor) {
    Ufo nuevo = new Ufo(3);
    flores.add(nuevo);
    instanteFlor = millis();
  }

  //blopis
  if (nivel < 6) {
    for (int x=0; x < blopis.size(); x++) {
      Ufo aux = blopis.get(x);
      aux.mover();
      aux.dibujar();

      if (pato.getPos().dist(aux.getPos()) < width/30) {
        explosionMocos.add(new ExplosionMoco(aux.getPos()));
        sfxMoco.trigger();        
        pato.sumarVida(aux.getVida());
        blopis.remove(x);
      }

      if (pato.ataque(aux.getPos())) {
        splashes.add(new Splash(aux.getPos()));
        sfxSplash.trigger();        
        if (blopis.size() > 0)
          blopis.remove(x);
      }
    }

    if (millis() - instanteBlopi > intervaloBlopi) {
      if ((nivel == 1 && blopis.size() < 5) || (nivel == 2 && blopis.size() < 7)) {
        Ufo nuevo = new Ufo(1);
        blopis.add(nuevo);
      }

      else if ((nivel == 3 && blopis.size() < 9) || (nivel == 4 && blopis.size() < 11)) {
        Ufo nuevo = new Ufo(round(random(1,2)));
        blopis.add(nuevo);
      }

      else if (nivel == 5 && blopis.size() < 13) {
        Ufo nuevo = new Ufo(2);
        blopis.add(nuevo);
      }

      instanteBlopi = millis();
    }
  }


  //else if (nivel == 6) {
  //  blop.dibujar();
  //  blop.disparar();

    if (blop.choqueEscupa(pato.getPos())) {
      splashes.add(new Splash(pato.getPos()));
      sfxSplash.trigger();      
      pato.sumarVida(blop.getValorVida());
    }

    if (pato.ataque(new PVector(width/2, height/2))) {
      blop.quitarVida();
      explosionMocos.add(new ExplosionMoco(new PVector(width/2, height/2)));
      sfxMoco.trigger();    
    }

    if (blop.getVida() == 0) {
      escenario = 4;
      mE2.pause();
      mE2.rewind();
      mE4.play();
      mE4.loop();
    }
  }

  if (pato.getPuntaje() % 300 == 0 && pato.getPuntaje() > 0) {
    if (cambioNivel == false && nivel < 6) {
      nivel++;
      sfxNivel.trigger();
      cambioNivel = true;
      intervaloBlopi -= 400;
      intervaloMosca -= 800;
      scambioNivel.trigger();

      //if (nivel == 6) {
      //  blop.reset();
      //}
    }
  }
  else {
    cambioNivel = false;
  }
  
  textSize(width/40);
  fill(#62b537);
  textAlign(LEFT);
  text("STAGE "+nivel, width/25, height/2);
  
  if (!pato.estaVivo()) {
      escenario = 3;
      mE2.pause();
      mE2.rewind();
      mE3.play();
      mE3.loop();
      instanteRestart = millis();
      moscas.clear();
  }

  pato.dibujar();

    // dibujar explosiones MOCO
  for (int x=0; x<explosionMocos.size(); x++) {
    ExplosionMoco tmp = explosionMocos.get(x);
    if (tmp.isActive()) {
      tmp.dibujar();
    }
    else
      explosionMocos.remove(x);
  }

   // dibujar Splash
  for (int x=0; x<splashes.size(); x++) {
    Splash tmp = splashes.get(x);
    if (tmp.isActive()) {
      tmp.dibujar();
    }
    else
      splashes.remove(x);
  }

    // dibujar explosiones moscas

  for (int x=0; x<choqueMoscas.size(); x++) {
    ChoqueMosca tmp = choqueMoscas.get(x);
    if (tmp.isActive()) {
      tmp.dibujar();
    }
    else
      choqueMoscas.remove(x);
  }
}

void escenario3() {
  loopingE3.loop();
  image(loopingE3, width/2, height/2, width, height);
  if (millis() - instanteRestart > esperaRestart) {
    escenario = 1;
    mE3.pause();
    mE3.rewind();
    mE1.play();
    mE1.loop();
  }
}

void escenario4() {
  loopingE4.loop();
  image(loopingE4, width/2, height/2, width, height);

}
void keyPressed() {
  if (key == '1') {
    escenario = 1;
    mE3.pause();
    mE3.rewind();
    mE1.play();
    mE1.loop();
  }

  else if (key == '2' && escenario == 1) {
    escenario = 2;
    pato.reinicio();

    instanteBlopi = millis();
    instanteMosca = millis();
    instanteFlor = millis();

    intervaloBlopi = 4000;
    intervaloMosca = 10000;
    intervaloFlor = 35000;

    blopis.clear();
    moscas.clear();
    flores.clear();

    nivel = 1;
    cambioNivel = false;

    mE1.pause();
    mE1.rewind();
    mE2.play();
    mE2.loop();
  }

  else if (escenario == 2) {
    if (key == ' ') {
      pato.disparar();
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
          pato.movD();
      }
      else if (keyCode == LEFT) {
          pato.movI();
      }
    }
  }

  else if (key == 'a' && escenario == 4) {
    escenario = 1;
    mE4.pause();
    mE4.rewind();
    mE1.play();
    mE1.loop();
  }
}

void keyReleased() {
  pato.noMov();
}
