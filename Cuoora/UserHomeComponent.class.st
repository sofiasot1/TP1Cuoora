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
	self renderHomepage: html
]

{ #category : #rendering }
UserHomeComponent >> renderFriendsOn: html [
	html strong: 'Mis amigxs: '.
	html
		unorderedList: [ self session user followed
				do: [ :friend | html listItem: friend username ] ]
]

{ #category : #rendering }
UserHomeComponent >> renderHomepage: html [
	"html
		anchor: [ html anchor
			callback: [self renderFriendsOn: html ];
				with: 'Mis amigos'].
		
	html
		anchor: [ html anchor
				callback: [ self renderQuestionsOn: html ];
				with: 'Mis preguntas' ]."

	html
		paragraph: [ html anchor
				callback: [ self createQuestion ];
				with: 'Hacer una nueva pregunta' ].
	
	html horizontalRule.
			
	html heading
		level2;
		with: 'Últimas preguntas'.
	html
		table: [ self relevantQuestions
				do: [ :question | self renderQuestion: question on: html ] ].
			
		
	self renderFriendsOn: html.
	self renderQuestionsOn: html.
]

{ #category : #rendering }
UserHomeComponent >> renderQuestionsOn: html [
	html strong: 'Mis preguntas: '.
	html
		unorderedList: [ self session user questions
				do: [ :question | html listItem: question title ] ]
]

{ #category : #rendering }
UserHomeComponent >> style [ 
	^ '.nav li {
  		display: inline-block;
  		font-size: 20px;
  		padding: 20px;
	}'
]
