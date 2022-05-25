class Item {
  boolean isAlive;
  float x, y;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;
  PImage img;


  Item(float x, float y) {
    isAlive = true;
    this.x = x;
    this.y = y;
  }


  void display() {
    if (isAlive==true) {
      image(img, x, y);
    }
  }

  void checkCollision(Player player) {
    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      isAlive=false;
    }
  }
}
