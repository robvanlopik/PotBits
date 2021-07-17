"
Puusage example:

myRemotePi := RpiBoard3B driver: (RpiPiGPIODriver onIP: '192.168.1.92' port: 8888)

also now:

clock := myRemotePi installDevice: (PotDS1307Device new)
"
Class {
	#name : #RpiPiGPIODriver,
	#superclass : #PotBoardDriver,
	#instVars : [
		'piGPIO',
		'ip',
		'port'
	],
	#category : #PotBits
}

{ #category : #accessing }
RpiPiGPIODriver class >> driver: aPiGPIOdriver [
	self new driver: aPiGPIOdriver
]

{ #category : #'instance creation' }
RpiPiGPIODriver class >> onIP: anIPAddress port: aPortNumber [
	^self new 
		ip: anIPAddress;
		port: aPortNumber
]

{ #category : #controlling }
RpiPiGPIODriver >> connectToBoard [
	piGPIO := PiGPIO onIP: ip port: port
]

{ #category : #'io protocols' }
RpiPiGPIODriver >> connectToI2CDevice: deviceAddressInt [ 
	"return a i2c connection that is specific for this addresss"
	
	^piGPIO openI2C: deviceAddressInt 
]

{ #category : #accessing }
RpiPiGPIODriver >> driver: aPiGPIOInstance [
	
	piGPIO := aPiGPIOInstance
]

{ #category : #accessing }
RpiPiGPIODriver >> ip [
	^ ip
]

{ #category : #accessing }
RpiPiGPIODriver >> ip: anObject [
	ip := anObject
]

{ #category : #accessing }
RpiPiGPIODriver >> piGPIO [
	^ piGPIO
]

{ #category : #accessing }
RpiPiGPIODriver >> port [
	^ port
]

{ #category : #accessing }
RpiPiGPIODriver >> port: anObject [
	port := anObject
]

{ #category : #operations }
RpiPiGPIODriver >> readDigitalValueFrom: aPin [
	^piGPIO digitalRead: aPin id
]

{ #category : #operations }
RpiPiGPIODriver >> setIOMode: aPinMode into: aPin [
	
	
	piGPIO pin: aPin id mode: aPinMode asWiringPiConstant
]

{ #category : #operations }
RpiPiGPIODriver >> writeDigitalValue: aBit into: aPin [
	piGPIO digitalWrite: aPin id value: aBit
]

{ #category : #operations }
RpiPiGPIODriver >> writePWMValue: anInteger into: aPin [
	piGPIO pin: aPin id pwmWrite: anInteger
]
