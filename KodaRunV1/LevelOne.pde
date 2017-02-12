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
 BackgroundLayer(Level owner)
 {
    super(owner);
    
    setBackgroundColor(color(0,100,210));
    Sprite background_picture = new Sprite("assets/sky.png");
    TilingSprite background = new TilingSprite(background_picture, 0,0,width, height);
    addBackgroundSprite(background);
    
    addBoundary(new Boundary(0,height-48,width,height-48));
    addBoundary(new Boundary(-1,0, -1,height));
    addBoundary(new Boundary( width+1,0, width+1,height));
    addBoundary(new Boundary(0,48,width,48));
    
    showBoundaries = true;
    addPlayer(new Koda(width/2, height/2));
 }
}