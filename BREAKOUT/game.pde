void game() {
  image(sky, 0, 0, 800, 800);
  textFont(A);


  //paddle
  fill(255);//draw paddle
  circle(px, py, pd);
  if (akey==true) px=px-5;
  if (dkey==true) px=px+5;//key movement

  //ball
  fill(255);
  circle(bx, by, bd);// draw ball
  bx=bx+vx;
  by=by+vy;

  //bouncing
  if (dist(bx, by, px, py)<bd/2+pd/2) {
    vx=(bx-px)/10;
    vy=(by-py)/10;
    wall.play();
    wall.rewind();
  }
  if (by<bd/2||by>height-bd/2) {
    vy=vy*-1;
    wall.play();
    wall.rewind();
    if (by>790) {
      lives=lives-1;
      boop.play();
      boop.rewind();
    }
  }
  if (bx<bd/2||bx>width-bd/2) {
    vx=vx*-1;
    wall.play();
    wall.rewind();
  }

  //paddles limitation
  if (px<100)px=100;
  if (px>700)px=700;

  //bricks 
  int i=0;
  while (i<n) {
    if (alive[i]==true) {
      manageBrick(i);
    }
    i=i+1;
  }
  textSize(30);
  fill(255);
  text("score:"+ score, 100, 700);

  text("lives:"+lives, 600, 700);

  if (lives==0||score==40) {
    mode=GAMEOVER;
    failure.rewind();
    win.rewind();
  } else {
    mode=GAME;
  }
}




void gameClicks() {
  if (mouseX>0&&mouseX<800&&mouseY>0&&mouseY<800);
  mode=PAUSE;
}


void manageBrick(int i) {
  if (y[i]==100) fill(C);
  if (y[i]==200) fill(D); 
  if (y[i]==300) fill(E);
  if (y[i]==400) fill(F);
  if (y[i]==500) fill(G);

  circle (x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i])<bd/2+brickd/2) {// brick collsions
    score++;
    beep.play();
    beep.rewind();
    vx=(bx-x[i])/10;
    vy=(by-y[i])/10;
    alive[i]=false;
  }
}
