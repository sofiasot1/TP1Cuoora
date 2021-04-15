Class {
	#name : #Reaction,
	#superclass : #Object,
	#instVars : [
		'owner',
		'creationDate'
	],
	#category : #'Cuoora-model'
}

{ #category : #accessing }
Reaction class >> withUser: anUser [
	^ self new withUser: anUser
]

{ #category : #initialization }
Reaction >> initialize [
	creationDate := Date today
]

{ #category : #initialization }
Reaction >> owner [
	^ owner
]

{ #category : #initialization }
Reaction >> withUser: anUser [
	owner := anUser
]
