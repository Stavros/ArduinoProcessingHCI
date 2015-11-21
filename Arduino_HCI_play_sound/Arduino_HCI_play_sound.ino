// Stavros Kalapothas
// Arduino & Processing HCI play sound
// Send on serial port values from sonar sensor
// Based on:
// - NewPing ultrasonic sensor library <http://code.google.com/p/arduino-new-ping>
// 03/2013 - CC - Distribute & Change freely to suit your needs

#include <NewPing.h>

#define TRIGGER_PIN  3  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     2  // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 50 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

//setup
void setup() {  
  Serial.begin(9600);                           // start the serial port
} 

// execute
void loop() {
  delay(250);                      // Wait 50ms between pings (about 20 pings/sec). 29ms should be the shortest delay between pings.
  unsigned int uS = sonar.ping(); // Send ping, get ping time in microseconds (uS).
  if ( uS / US_ROUNDTRIP_CM > 0)  // send only values >0
  {
  Serial.println(uS / US_ROUNDTRIP_CM); // Convert ping time to distance and print result (0 = outside set distance range, no ping echo)
  }
}
