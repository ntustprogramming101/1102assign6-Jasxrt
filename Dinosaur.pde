class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class
  float speed=1f ;
  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;

  Dinosaur(float x, float y) {
    super(x, y);
  }


  void display() {
    // image(dinosaur, x, y);
    if (speed<0) {
      pushMatrix();
      translate(x+w, y);
      scale(-1, 1);
      image(dinosaur, 0, 0);
      popMatrix();
    }else{
      image(dinosaur, x, y);
    }
  }

  void update() {
    x += speed;
    if (x+h>= width) {
      speed=-1f;
    }
    if (x<=0) {
      speed=1f;
    }
    if (speed==1f) {
      if (player.y+player.h>y&&player.y<y+h&&player.x> x+w) {
        speed=5;
      }
    } else  if (speed==-1f) {
      if (player.y+player.h>y&&player.y<y+h&&player.x+player.w< x) {
        speed=-5;
      }
    }
  }
  // HINT: Player Detection in update()
  /*
	float currentSpeed = speed
   	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
   		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
   	}
   	*/
}
