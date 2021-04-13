Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'Cuoora-model'
}

{ #category : #'as yet unclassified' }
Answer class >> fromOwner:aUser withText:aText toQuestion:aQuestion [
	"instances a new Question object and calls instance method."

	^ (self withOwner:aUser andText: aText) toQuestion:aQuestion 



	
]

{ #category : #accessing }
Answer >> question [
^question
]

{ #category : #initialization }
Answer >> toQuestion: aQuestion [
   question:=aQuestion.
	aQuestion addAnswer: self.
	owner registerAnswer: self toQuestion: aQuestion.
]
