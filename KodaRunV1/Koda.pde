class Koda extends Player
{
 Koda(float x, float y)
 {
   super("Koda");
   setStates();
   setPosition(x,y);
   handleKey('W');
   handleKey('A');
   handleKey('D');
   setForces(0, DOWN_FORCE);
   setAcceleration(0,ACCELERATION);
   setImpulseCoefficients(DAMPENING, DAMPENING);
 }
 
 void setStates()
 {
    addState(new State("idle", "assets/koda_idle.png", 5, 5));
    addState(new State("running", "assets/koda_running.png", 3, 1));
    State jumping = new State("jumping", "assets/koda_jumping.png");
    jumping.setDuration(10);
    addState(jumping);
 }
 
 void handleInput()
 {
    //running
    if(isKeyDown('A') || isKeyDown('D')) {
      if (isKeyDown('A')) {
        setHorizontalFlip(true);
        addImpulse(-2, 0);
      }
      if (isKeyDown('D')) {
        setHorizontalFlip(false);
        addImpulse(2, 0);
      }
    }
 
    //jumping
    if(isKeyDown('W') && active.name!="jumping" && boundaries.size()>0) {
      addImpulse(0,-35);
      setCurrentState("jumping");
    }
    
    if(active.mayChange())
    {
       if(isKeyDown('A') || isKeyDown('D'))
       {
          setCurrentState("running"); 
       }
       else
       {
          setCurrentState("idle");
       }
    }
    else{
       setCurrentState("idle"); 
    }
   if(!isKeyDown('A') && !isKeyDown('D') && !isKeyDown('W'))
   {
      setCurrentState("idle");    
   }
 }
}