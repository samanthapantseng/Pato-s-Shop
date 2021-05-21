class ExplosionMoco {
  
  SpriteSheet olorMoco;
  PVector position;
  boolean active;
  
  public ExplosionMoco(PVector _position) {
    olorMoco = new SpriteSheet("olorMoco_", 7, "png");
    position = _position;
    active = true;
    olorMoco.noLoop();
    olorMoco.play();
  }
  
  void dibujar() {
    imageMode(CENTER);
    olorMoco.display(position.x, position.y);
    if (olorMoco.isFinished())
      active = false;
  }
  
  boolean isActive() {
    return active;
  }
}
