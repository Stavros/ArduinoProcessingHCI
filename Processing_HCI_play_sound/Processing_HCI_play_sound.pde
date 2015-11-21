// Stavros Kalapothas
// Arduino & Processing HCI play sound
// Listen on serial port values and play notes
// Based on:
// - Lucky Larry examples <http://luckylarry.co.uk>
// - Minim audio library <http://code.compartmental.net/tools/minim>
// 03/2013 - CC - Distribute & Change freely to suit your needs

import processing.serial.*;                // import serial library so we can read the serial port
import ddf.minim.*; 

// define the serial port
Serial myPort;          

// define minim variables:
// here we say that variable A is an audiosample etc...
Minim minim;
AudioSample GSharp;
AudioSample A;
AudioSample Bb;
AudioSample B;
AudioSample C;
AudioSample CSharp;
AudioSample D;
AudioSample Eb;
AudioSample E;
AudioSample F;
AudioSample FSharp;
AudioSample G;

// setup
void setup () {

  // set up the variables, loading in the sound files from your project folder
  // which should be the same place as where you save this sketch
  // details on using minim and audioSample are here: http://code.compartmental.net/tools/minim/manual-audiosample/
  minim = new Minim(this);
  GSharp = minim.loadSample("GSharp.wav", 2048);
  A = minim.loadSample("A.wav", 2048);
  Bb = minim.loadSample("Bb.wav", 2048);
  B = minim.loadSample("B.wav", 2048);
  C = minim.loadSample("C.wav", 2048);
  CSharp = minim.loadSample("CSharp.wav", 2048);
  D = minim.loadSample("D.wav", 2048);
  Eb = minim.loadSample("Eb.wav", 2048);
  E = minim.loadSample("E.wav", 2048);
  F = minim.loadSample("F.wav", 2048);
  FSharp = minim.loadSample("FSharp.wav", 2048);
  G = minim.loadSample("G.wav", 2048);

  // List serial ports, saves us trying to figure out which COM we're using.
  println(Serial.list());
  // Open the active port - providing you've only got one sending serial data (which you should)
  myPort = new Serial(this, Serial.list()[1], 9600);
  // don’t read the serial buffer until we see a new line - this is genius and simple compared with my last efforts
  myPort.bufferUntil('\n');
}

void draw() {
  // we need to declare the draw function even though we're not using it!!
}

void serialEvent (Serial myPort) {
  // get the string from the serial buffer - gets all chars until the next line break...
  String bufferString = myPort.readStringUntil('\n');

  if (bufferString != null) {
    // get rid of any whitespace - sometimes the serial buffer can have blanks etc.. in the string
    bufferString = trim(bufferString);
    // convert the value to an int - we're only sending numbers over the serial port so parsing it to an int shouldn't ever be an issue.
    float inByte = float(bufferString);
    int pulse = int(bufferString);         // declare a variable to hold our value.
    println(pulse);                        // for debug print the value so we can check it.

    // remember that our pulse is in CM so if its less than 5cm then do this etc... else do this... else do this.. for as many sound samples
    if ( pulse < 5 ) {
      GSharp.trigger();
      delay(25);
    }
    else if ( pulse < 8 ) {
      A.trigger();
      delay(25);
    }
    else if ( pulse < 11 ) {
      Bb.trigger();
      delay(25);
    }
    else if ( pulse < 14 ) {
      B.trigger();
      delay(25);
    }
    else if ( pulse < 17 ) {
      C.trigger();
      delay(25);
    }
    else if ( pulse < 20 ) {
      CSharp.trigger();
      delay(25);
    }
    else if ( pulse < 23 )  {
      D.trigger();
      delay(25);
    }
    else if ( pulse < 26 ) {
      Eb.trigger();
      delay(25);
    }
    else if ( pulse < 29 ) {
      E.trigger();
      delay(25);
    }
    else if ( pulse < 32 ) {
      F.trigger();
      delay(25);
    }
    else if ( pulse < 35 ) {
      FSharp.trigger();
      delay(25);
    }
    else if ( pulse < 38 ) {
      G.trigger();
      delay(25);
    }
    else if ( pulse > 50 ) {
      // if the distance is greater than 50cm then play nothing
    }

  } // end if there's a value in the serial bufferstring

}   // end void serialevent()

void stop(){
  minim.stop();
  super.stop();
}
