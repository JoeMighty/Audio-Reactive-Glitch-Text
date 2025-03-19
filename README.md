# Audio-Reactive-Glitch-Text
![Screenshot 2025-03-17 210710](https://github.com/user-attachments/assets/2ac098f6-ed7a-4504-bdb4-b39f1f59a84b)<br>
A Processing sketch that reacts to microphone input by dynamically resizing and glitching text based on audio amplitude.<br> Features a ControlP5 GUI for real-time text input, size adjustments, and a glitch toggle. Built with Minim for audio processing.

<I><b><h3>To install the ControlP5 and Minim libraries in Processing, follow these steps:</h3></b></i>

1. Installing ControlP5:<br>
<ul><li>Open Processing.</li><br>
<li>Go to Sketch > Import Library > Add Library.</li><br>
<li>In the Contribution Manager, type ControlP5 in the search bar.</li><br>
<li>Click on ControlP5 in the search results and then click Install.</li></ul><br>
2. Installing Minim:<br><be>
<ul><li>Open Processing.</li><br>
<li>Go to Sketch > Import Library > Add Library.</li><br>
<li>In the Contribution Manager, type Minim in the search bar.</li><br>
<li>Click on Minim in the search results and then click Install.</li></ul><br><br>
<i>Once both libraries are installed, you can use them in your sketch by including them at the top of your code:</i><br>

  ```java
import controlP5.*; // For ControlP5
import ddf.minim.*; // For Minim
```
<I><b><h3>How to Modify the Code:</h3></b></i>
Change the default text
Edit this line in setup():

 ```java
String displayText = "Your Text Here!";
```


Adjust the base text size
Use the slider or manually change:

 ```java
float textSizeFactor = 50; // Increase for larger text
```


Change how much text reacts to sound
Modify:

 ```java
float amplitudeScale = 200; // Increase for stronger size changes
```


Enable/Disable the glitch effect
Use the GUI toggle or manually set:

 ```java
boolean glitchEnabled = true; // Set to false to disable
```


Change glitch intensity
Modify the values inside applyGlitchEffect():

 ```java
for (int i = 10; i++) // Increase for more distortion layers
float xOffset = random(-level * 100, level * 100); // Increase for more shift
float yOffset = random(-level * 100, level * 100); 
```


