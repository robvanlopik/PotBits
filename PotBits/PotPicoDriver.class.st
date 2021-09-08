"
I am intermediate between a PicoBoard and the base driver PicoDriver. I implement the translations mandated by the PoT model
"
Class {
	#name : #PotPicoDriver,
	#superclass : #PotBoardDriver,
	#instVars : [
		'port',
		'baudRate',
		'picodDriver'
	],
	#category : #PotBits
}

{ #category : #'instance creation' }
PotPicoDriver class >> onPort: port baudRate: baudRate [
	^self new
		port: port;
		baudRate: baudRate
]

{ #category : #accessing }
PotPicoDriver >> baudRate [
	^ baudRate
]

{ #category : #accessing }
PotPicoDriver >> baudRate: anObject [
	baudRate := anObject
]

{ #category : #controlling }
PotPicoDriver >> connectToBoard [
	"create the base driver instance with the parameters available"
	picodDriver := PicodDriver new connectOnPort: port baudRate: baudRate
]

{ #category : #accessing }
PotPicoDriver >> picodDriver [
	^ picodDriver
]

{ #category : #accessing }
PotPicoDriver >> picodDriver: anObject [
	picodDriver := anObject
]

{ #category : #accessing }
PotPicoDriver >> port [
	^ port
]

{ #category : #accessing }
PotPicoDriver >> port: anObject [
	port := anObject
]

{ #category : #operations }
PotPicoDriver >> readDigitalValueFrom: aPin [
	^picodDriver digitalRead: aPin id
]

{ #category : #operations }
PotPicoDriver >> writeDigitalValue: aBit into: aPin [
	picodDriver digitalWrite: aPin id value: aBit 
]

{ #category : #operations }
PotPicoDriver >> writePWMValue: anInteger into: aPin [
	"default to frequency 1000 Hz"
	picodDriver pwmOnPin: aPin id value: anInteger  frequency: 1000 
]
