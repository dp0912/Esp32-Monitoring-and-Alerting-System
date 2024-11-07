#include <WiFi.h>

const char* ssid = "S23";
const char* password = "987654321";

void setup() {
    Serial.begin(115200);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(1000);
        Serial.println("Connecting to WiFi...");
    }
    Serial.println("Connected to WiFi");
}

void loop() {
    // Read sensors and print to Serial
    int ldrValue = analogRead(35);        // LDR on pin 35
    int soundValue = analogRead(34);      // Sound sensor on pin 34
    float distanceValue = getDistance();   // Function to read ultrasonic sensor

    Serial.print("LDR=");
    Serial.print(ldrValue);
    Serial.print(",Sound=");
    Serial.print(soundValue);
    Serial.print(",Distance=");
    Serial.println(distanceValue);

    delay(5000);  // Send data every 5 seconds
}

float getDistance() {
    long duration;
    digitalWrite(2, LOW);
    delayMicroseconds(2);
    digitalWrite(2, HIGH);
    delayMicroseconds(10);
    digitalWrite(2, LOW);
    duration = pulseIn(4, HIGH);
    return (duration * 0.034 / 2);  // Calculate distance in cm
}
