import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int screenWidth = 512;
final int screenHeight = 432;
float DOWN_FORCE = 2;
float ACCELERATION = 1.3;
float DAMPENING = 0.75;


void initialize()
{
  addScreen("level", new LevelOne(2*width, height));
  frameRate(30);
}