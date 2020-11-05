void intro() {
  intro.play();
  textFont(A);

  image(gif[f ], 0, 0, width, height);
  f=f+1;
  if (f==numberOfFrames) f=0;

  strokeWeight(1);
  fill(255); 
  textSize(60);
  text("Breackout", 150, 400);
  textSize(20);
  text("-click to start-", 270, 700);
}


void introClicks() {
  if (mouseX>0&&mouseX<800&&mouseY>0&&mouseY<800) {
    mode=GAME;
  }
}
