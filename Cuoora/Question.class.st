Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'topics',
		'answers'
	],
	#category : #'Cuoora-model'
}

{ #category : #'as yet unclassified' }
Question class >> withTopics: questionTopics title: aTitle text: aText user: aUser [
	"instances a new Question object and calls instance method."

	^ (self withOwner: aUser andText: aText)
		withTopics: questionTopics
		title: aTitle
]

{ #category : #actions }
Question >> addAnswer: anAnswer [
	answers add: anAnswer
]

{ #category : #accessing }
Question >> answers [ 
	^answers
]

{ #category : #'as yet unclassified' }
Question >> answersOrderedByScore [
	"Este método arma una colección de respuestas ordenadas de manera descendente por puntaje"

	^ answers
		asSortedCollection: [ :answer1 :answer2 | answer1 score > answer2 score ]
]

{ #category : #actions }
Question >> commonTopics: userTopics [
	(0 < (userTopics intersect: topics) size)
   		ifTrue: [ ^ self ]
]

{ #category : #actions }
Question >> hasTopic: aTopic [
	"checks if question has aTopic in its topics collection"

	(topics includes: aTopic)
		ifTrue: [ ^ self ]
]

{ #category : #initialization }
Question >> initialize [
	"comment stating purpose of message"

	super initialize.
	answers := OrderedCollection new.
	topics := OrderedCollection new.
]

{ #category : #actions }
Question >> removal [
	self topics do:  [ :topic | topic removeQuestion: self ].
	self owner removeQuestion: self.
]

{ #category : #accessing }
Question >> title [ 	
	^title
]

{ #category : #setter }
Question >> title: aTitle [
	title := aTitle.
]

{ #category : #accessing }
Question >> topics [
	^topics
]

{ #category : #initialization }
Question >> withTopics: questionTopics title: aTitle [ 
	"sets IV"
	title:= aTitle.
	topics addAll: questionTopics.
	owner addQuestion: self.
	questionTopics do: [:topic | topic addQuestion: self].
	
]
