class ChoqueMosca {
  
  SpriteSheet zumbido;
  PVector position;
  boolean active;
  
  public ChoqueMosca(PVector _position) {
    zumbido = new SpriteSheet("zumbido_", 8, "png");
    position = _position;
    active = true;
    zumbido.noLoop();
    zumbido.play();
  }
  
  void dibujar() {
    imageMode(CENTER);
    zumbido.display(position.x, position.y);
    if (zumbido.isFinished())
      active = false;
  }
  
  
  boolean isActive() {
    return active;
  }
}
