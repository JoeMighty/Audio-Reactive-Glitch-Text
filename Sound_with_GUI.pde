import ddf.minim.*;
import controlP5.*;

Minim minim;
AudioInput mic;
ControlP5 cp5;
String displayText = "Hello, World!";
float textSizeFactor = 50;
float amplitudeScale = 200;
boolean glitchEnabled = true;

void setup() {
  size(800, 600);
  background(0);
  
  // Initialize Minim and microphone input
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 512);
  
  // Initialize GUI
  cp5 = new ControlP5(this);
  cp5.addTextfield("Text")
     .setPosition(20, 20)
     .setSize(200, 30)
     .setText(displayText)
     .setAutoClear(false);
  
  cp5.addSlider("textSizeFactor")
     .setPosition(20, 60)
     .setSize(200, 20)
     .setRange(10, 200)
     .setValue(textSizeFactor);
  
  cp5.addSlider("amplitudeScale")
     .setPosition(20, 90)
     .setSize(200, 20)
     .setRange(50, 500)
     .setValue(amplitudeScale);
  
  cp5.addToggle("glitchEnabled")
     .setPosition(20, 120)
     .setSize(50, 20)
     .setValue(glitchEnabled);
}

void draw() {
  background(0);
  float level = mic.mix.level();
  float sizeVariation = level * amplitudeScale;
  float x = width / 2;
  float y = height / 2;
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(textSizeFactor + sizeVariation);
  
  if (glitchEnabled && level > 0.05) { // Apply glitch effect when audio is strong
    for (int i = 0; i < 5; i++) {
      float xOffset = random(-level * 50, level * 50);
      float yOffset = random(-level * 50, level * 50);
      fill(random(100, 255), random(100, 255), random(100, 255));
      text(displayText, x + xOffset, y + yOffset);
    }
  }
  
  fill(255);
  text(displayText, x, y);
}

void controlEvent(ControlEvent event) {
  if (event.isFrom("Text")) {
    displayText = event.getStringValue();
  }
}
