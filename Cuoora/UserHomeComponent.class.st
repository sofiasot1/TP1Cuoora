Class {
	#name : #UserHomeComponent,
	#superclass : #AbstractUserHomeComponent,
	#category : #'Cuoora-ui'
}

{ #category : #rendering }
UserHomeComponent >> createQuestion [
	| create_question_component |
	create_question_component := CreateQuestionComponent new.
	self call: create_question_component.
	
]

{ #category : #initialization }
UserHomeComponent >> initialize [ 
	super initialize.
]

{ #category : #rendering }
UserHomeComponent >> relevantQuestions [
	^(cuoora relevantQuestionsForUser: (self session user)) 
	"asSortedCollection sortBlock: [:q1 :q2 | q1 creationDate <= q1 creationDate]."
]

{ #category : #rendering }
UserHomeComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderHomepage: html.
]

{ #category : #rendering }
UserHomeComponent >> renderHomepage: html [
	html
		paragraph: [ html anchor
				callback: [ self createQuestion ];
				with: 'Hacer una nueva pregunta' ].
	html heading
		level2;
		with: 'Ultimas preguntas'.
	html
		table: [ self relevantQuestions
				do: [ :question | self renderQuestion: question on: html ] ]
]
