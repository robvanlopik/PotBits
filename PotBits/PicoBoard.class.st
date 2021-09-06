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

{ #category : #initialization }
PicoBoard class >> defaultDriver [
	^PotPicoDriver onPort: '/dev/ttyACM1' baudRate: 230400
]

{ #category : #initialization }
PicoBoard >> initialize [ 
	"treat the board as the connector X with the USB port on top"
	super initialize .
	
	self addNewConnector: 'X' with: 
		{ 	0 gpio . 3.3 powerPin .
			1 gpio . 3.3 powerPin .
			0 powerPin . 0 powerPin .
			2 gpio . 3.3 powerPin .
			3 gpio . 3.3 powerPin .
			4 gpio . 3.3 powerPin .
			5 gpio . 28 gpio .
			0 powerPin . 0 powerPin .
			6 gpio . 27 gpio .
			7 gpio . 26 gpio .
			8 gpio . 0 powerPin .
			9 gpio . 22 gpio .
			0 powerPin . 0 powerPin .
			10 gpio . 21 gpio .
			11 gpio . 20 gpio .
			12 gpio . 19 gpio .
			13 gpio . 18 gpio .
			0 powerPin . 0 powerPin .
			14 gpio . 17 gpio .
			15 gpio . 16 gpio }

]

{ #category : #initialization }
PicoBoard >> sclPinId [
	"half of the pins can be scl, but we choose a default on channel 0"
		^5
]

{ #category : #initialization }
PicoBoard >> sdaPinId [
		"most pins can be sda but we choose a default on channel 0"
			^4
]
