"
I represent a Raspberry Pi Pico board. I need:
- the picod daemon running on the Pico
- the PicodDriver for the serial communication with the Pico
- the PotPicoDriver that is intermediate between the previous items

"
Class {
	#name : #PicoBoard,
	#superclass : #PotBoard,
	#category : #PotBits
}
