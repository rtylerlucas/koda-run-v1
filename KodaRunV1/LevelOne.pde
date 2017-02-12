class LevelOne extends Level
{
  LevelOne(float levelWidth, float levelHeight)
  {
    super(levelWidth, levelHeight);
    addLevelLayer("backgroundLayer", new BackgroundLayer(this));
    setViewBox(0,0,screenWidth,screenHeight);
  }
}

class BackgroundLayer extends LevelLayer
{
  Koda koda;
 BackgroundLayer(Level owner)
 {
    super(owner);
    setBackgroundColor(color(0,100,210));
    Sprite background_picture = new Sprite("assets/sky.png");
    TilingSprite background = new TilingSprite(background_picture, 0,0,width, height);
    addBackgroundSprite(background);
    
    addBoundary(new Boundary(0,height-48,width,height-48));
    addBoundary(new Boundary(-1,0, -1,height));
    addBoundary(new Boundary(-1 + width,height, width+1,0));
    addBoundary(new Boundary(width,48, 0,48));
    
    showBoundaries = true;
    koda = new Koda(width/2, height/2);
    addPlayer(koda);
   
 }
 
 void draw()
 {
   super.draw();
    viewbox.track(parent, koda); 
 }
}