class LevelOne extends Level
{
  LevelOne(float levelWidth, float levelHeight)
  {
    super(levelWidth, levelHeight);
    setViewBox(0, 0, screenWidth, screenHeight);
    addLevelLayer("background", new BackgroundLayer(this));
    addLevelLayer("kodaLayer", new KodaLayer(this));
  }
}

class KodaLayer extends LevelLayer
{
  Koda koda;
  KodaLayer(Level owner)
  {
    super(owner);
    Sprite background_picture = new Sprite("assets/trees.png");
    TilingSprite background = new TilingSprite(background_picture, 0, 0, width, height);
    addBackgroundSprite(background);

    addBoundary(new Boundary(0, height-48, width, height-48));
    addBoundary(new Boundary(-1, 0, -1, height));
    addBoundary(new Boundary(-1 + width, height, width+1, 0));
    addBoundary(new Boundary(width, 48, 0, 48));  

    showBoundaries = false;
    koda = new Koda(width/2, height/2);
    addPlayer(koda);

    addGround(-32, height-48, width+32, height);
  }

  void addGround(float x1, float y1, float x2, float y2) {
    Sprite grassy = new Sprite("assets/ground-top.png");
    TilingSprite groundline = new TilingSprite(grassy, x1, y1, x2, y1+16);
    addBackgroundSprite(groundline);

    Sprite filler = new Sprite("assets/ground-filler.png");
    TilingSprite groundfiller = new TilingSprite(filler, x1, y1+16, x2, y2);
    addBackgroundSprite(groundfiller);

    addBoundary(new Boundary(x1, y1, x2, y1));
  }  


  void draw()
  {
    super.draw();
    viewbox.track(parent, koda);
  }
}

class BackgroundLayer extends LevelLayer {
  BackgroundLayer(Level owner) {
    super(owner, owner.width, owner.height, 0, 0, 0.75, 0.75);
    setBackgroundColor(color(0, 5, 20));
    addBackgroundSprite(new TilingSprite(new Sprite("assets/stars.png"), 0, 0, width*(1.5), height));
  }
}