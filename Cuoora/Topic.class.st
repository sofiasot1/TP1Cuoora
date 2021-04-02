"
I'm a cuOOra app topic. I represent a question's topic, in other word, what is the 
question about.

I'm used to say what is a question related to.
I know the name and description of a topic.

No collaborators. 
"
Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'Cuoora-model'
}

{ #category : #'as yet unclassified' }
Topic class >> name: aName description: aDescription [
	^self new name: aName description: aDescription 
]

{ #category : #initialization }
Topic >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #initialization }
Topic >> description [
	^description
]

{ #category : #initialization }
Topic >> description: aDescription [
	description := aDescription 
]

{ #category : #initialization }
Topic >> initialize [ 
	questions := OrderedCollection new.
]

{ #category : #initialization }
Topic >> name [
	^name
	
]

{ #category : #initialization }
Topic >> name: aName [
	name := aName  
	
]

{ #category : #initialization }
Topic >> name: aName description: aDescription [
	name := aName.
	description := aDescription. 
]

{ #category : #initialization }
Topic >> questions [
	^questions
]

{ #category : #initialization }
Topic >> removeQuestion: aQuestion [
	questions remove: aQuestion ifAbsent: [ ^nil ]
]
