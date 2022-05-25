class Robot extends Enemy {
  // Requirement #5: Complete Dinosaur Class

  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;
  float speed=2f;
  Laser lasers;


  Robot(float x, float y) {
    super(x, y);
    lasers=new Laser();
  }

  void display() {

    lasers.display();
    if (speed<=0) {
      pushMatrix();
      translate(x+w, y);
      scale(-1, 1);
      image(robot, 0, 0);
      popMatrix();
    } else {
      image(robot, x, y);
    }
  }
  void checkCollision(Player player) {
    lasers.checkCollision(player);
  }

  void update() {
    lasers.update();
    x += speed;
    if (x+h>= width) {
      speed=-2f;
    }
    if (x<=0) {
      speed=2f;
    }
    if (player.y+player.h>y-160&&player.y<y+h+160) {
      if (speed==2f) {
        if (player.x> x+w) {
          speed=0;
          lasers.isAlive=true;
        }
      } else  if (speed==-2f) {
        if (player.x+player.w< x) {
          speed=0;
          lasers.isAlive=true;
        } else {
          lasers.isAlive=false;
        }
      }
    }

    if (speed==2f) {
      lasers.fire(x-HAND_OFFSET_X_FORWARD, y-HAND_OFFSET_Y, player.x, player.y);
    }
    if (speed==-2f) {
      lasers.fire(x-HAND_OFFSET_X_BACKWARD, y-HAND_OFFSET_Y, player.x, player.y);
    }
  }

  // HINT: Player Detection in update()
  /*

   	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
   					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
   
   	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
   
   	if(checkX AND checkY){
   		Is laser's cooldown ready?
   			True  > Fire laser from my hand!
   			False > Don't do anything
   	}else{
   		Keep moving!
   	}
   
   	*/
}
