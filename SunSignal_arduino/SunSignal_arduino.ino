int photocellPin = 0; // the cell and 10K pulldown are connected to a0
    int photocellReading; // the analog reading from the sensor divider
    int LEDpin = 13; // connect LED to pin 13 (PWM pin) 
    int LEDbrightness; //
    void setup(void) {
    Serial.begin(9600);    // We'll send debugging information via the Serial monitor so if you can read it   without using a led

    }
    void loop(void) {
    photocellReading = analogRead(photocellPin);
    Serial.println(photocellReading); // the raw analog reading
    // LED gets brighter the darker it is at the sensor
    // that means we have to -invert- the reading from 0-1023 back to 1023-0
    photocellReading = 1023 - photocellReading;    //now we have to map 0-1023 to 0-255 since thats the          range analogWrite uses
    LEDbrightness = map(photocellReading, 0, 1023, 0, 255);
    analogWrite(LEDpin, LEDbrightness);
    delay(50);        
    }
