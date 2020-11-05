void pause() {
  intro.pause();
  textSize(100);
  fill(0);
  text("PAUSED", 100, 500);
}

void pauseClicks() {
  if (mouseX>0&&mouseX<800&&mouseY>0&&mouseY<800);
  mode=GAME;
  intro.play();
} 
