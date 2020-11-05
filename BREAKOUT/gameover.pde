void gameover() {
  intro.pause();
  textFont(A);
  image(gif[f ], 0, 0, width, height);
  f=f+1;
  if (f==numberOfFrames) f=0;
  if (score==40) {
    textSize(60);
    fill(255);
    text("YOU WON!", 150, 400);
    win.play();
  }
  if (lives==0) {
    fill(255);
    textSize(60);
    text("YOU LOST!", 150, 400);
    failure.play();
  }
  textSize(20);
  text("-click to restart-", 270, 700);
}

void gameoverClicks() {
  reset();
  if (mouseX>0&&mouseX<800&&mouseY>0&&mouseY<800) {
    mode=INTRO;
  }
}
void reset() {
  numberOfFrames= 39;
  gif= new PImage[numberOfFrames];
  int a=0;
  while (a<numberOfFrames) {
    gif[a]=loadImage("frame_" +a+ "_delay-0.03s.gif");
    a++;
  }

  //brick
  brickd=50;
  n=40;
  x=new int [n];
  y=new int [n];
  alive=new boolean [n];
  tempx=120;
  tempy=100;
  int i=0;
  while (i<n) {
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+80;
    if (tempx> 680) {
      tempx=120;
      tempy=tempy+100;
    }
    i=i+1;
  }


  //initialize paddles
  px=width/2;
  py=800;
  pd=200;


  //initialize ball
  bx=width/2;
  by=650;
  bd=20;
  vy= 1;

  //initialize keyboard vars
  akey=dkey=false;

  //initialize lives
  lives=3;
  score=0;
}
