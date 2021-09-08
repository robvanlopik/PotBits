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
PotPicoDriver >> setIOMode: aPinMode into: aPin [
	(aPinMode asWiringPiConstant = 1) ifTrue: 
		[ ^picodDriver setGpiosOutput: {aPin id} values: #(0)].
	(aPinMode asWiringPiConstant = 0) ifTrue: 
		[ ^picodDriver setGpiosInput: { aPin id} ]
]

{ #category : #operations }
PotPicoDriver >> setPUDResister: aPinResisterClass into: aPin [
	"aPinResisterClass asWiingPiConstant gives the situation desired:
	0 = none
	1 = down
	2 = up"
	| pudCode |
	pudCode := aPinResisterClass asWiringPiConstant.
	(pudCode = 0) ifTrue: [ ^picodDriver pullsNone: {aPin id}].
	(pudCode = 1) ifTrue: [ ^picodDriver pullsDown: {aPin id}].
	(pudCode = 2) ifTrue: [ ^picodDriver pullsUp: {aPin id}].
	"there is no pudCode for #pullsBoth:"
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
