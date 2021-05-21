class Splash {
  
  SpriteSheet splash;
  PVector position;
  boolean active;
  
  public Splash(PVector _position) {
    splash = new SpriteSheet("splash_", 11, "png");
    position = _position;
    active = true;
    splash.noLoop();
    splash.play();
  }
  
  void dibujar() {
    imageMode(CENTER);
    splash.display(position.x, position.y);
    if (splash.isFinished())
      active = false;
  }
  
  
  boolean isActive() {
    return active;
  }
}
