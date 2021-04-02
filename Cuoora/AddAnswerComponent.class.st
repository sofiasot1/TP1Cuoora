Class {
	#name : #AddAnswerComponent,
	#superclass : #AbstractQuestionDetailComponent,
	#instVars : [
		'text'
	],
	#category : #'Cuoora-ui'
}

{ #category : #'as yet unclassified' }
AddAnswerComponent class >> question: aQuestion [
	^ self new
		question: aQuestion;
		yourself
]

{ #category : #'as yet unclassified' }
AddAnswerComponent >> cancelar [
	self answer.
]

{ #category : #'as yet unclassified' }
AddAnswerComponent >> guardar [
	Answer answer: question withText: text user: self session user. 
	self answer.
]

{ #category : #rendering }
AddAnswerComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		form: [ html
				paragraph: [ html label: 'RESPUESTA: '.
					html textArea columns: 60; rows: 8; on: #text of: self ].
			html button
				callback: [ self cancelar ];
				with: 'Cancelar'.
			html space.
			html button
				callback: [ self guardar ];
				with: 'Guardar' ]
]

{ #category : #'as yet unclassified' }
AddAnswerComponent >> text [
	^text
]

{ #category : #'as yet unclassified' }
AddAnswerComponent >> text: aText [
	text := aText.
]
