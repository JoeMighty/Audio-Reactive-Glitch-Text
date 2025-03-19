import ddf.minim.*;
import controlP5.*;

// Audio and GUI variables
Minim minim;             // Audio library for microphone input
AudioInput mic;          // Microphone input
ControlP5 cp5;          // GUI library
String displayText = "Hello, Processing!"; // Default text
float textSizeFactor = 50; // Base text size
float amplitudeScale = 200; // How much text size reacts to audio
boolean glitchEnabled = true; // Toggle for glitch effect

void setup() {
  size(800, 600);
  background(0);
  
  // Initialize Minim and microphone input
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 512); // Capture mono audio input

  // Initialize GUI using ControlP5
  cp5 = new ControlP5(this);
  
  // Text input field
  cp5.addTextfield("Text")
     .setPosition(20, 20)  // Position in the GUI window
     .setSize(200, 30)     // Width and height
     .setText(displayText) // Default text
     .setAutoClear(false); // Keep the text after pressing Enter
  
  // Slider to adjust base text size
  cp5.addSlider("textSizeFactor")
     .setPosition(20, 60)
     .setSize(200, 20)
     .setRange(10, 200)  // Min & Max values for text size
     .setValue(textSizeFactor);

  // Slider to adjust how much the text scales with sound
  cp5.addSlider("amplitudeScale")
     .setPosition(20, 90)
     .setSize(200, 20)
     .setRange(50, 500)  // Min & Max values for amplitude effect
     .setValue(amplitudeScale);

  // Toggle button to enable/disable glitch effect
  cp5.addToggle("glitchEnabled")
     .setPosition(20, 120)
     .setSize(50, 20)
     .setValue(glitchEnabled);
}

void draw() {
  background(0);
  float level = mic.mix.level();  // Get current microphone amplitude
  float sizeVariation = level * amplitudeScale; // Scale text size based on volume
  float x = width / 2;  // Center position X
  float y = height / 2; // Center position Y

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(textSizeFactor + sizeVariation); // Adjust text size dynamically
  
  if (glitchEnabled && level > 0.05) { // Apply glitch effect when audio is strong
    applyGlitchEffect(x, y, level);
  }

  fill(255);
  text(displayText, x, y); // Draw main text
}

// Function to apply a glitch effect
void applyGlitchEffect(float x, float y, float level) {
  for (int i = 0; i < 5; i++) { // Draw multiple layers for a glitch effect
    float xOffset = random(-level * 50, level * 50); // Random horizontal shift
    float yOffset = random(-level * 50, level * 50); // Random vertical shift
    fill(random(100, 255), random(100, 255), random(100, 255)); // Random color
    text(displayText, x + xOffset, y + yOffset); // Draw glitched text
  }
}

// Handles text updates from the GUI
void controlEvent(ControlEvent event) {
  if (event.isFrom("Text")) {
    displayText = event.getStringValue(); // Update display text when input changes
  }
}
