Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-ui'
}

{ #category : #accessing }
CuooraSession >> user [
	^user
]

{ #category : #accessing }
CuooraSession >> user: anObject [ 
	user := anObject
]
