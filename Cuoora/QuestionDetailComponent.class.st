Class {
	#name : #QuestionDetailComponent,
	#superclass : #AbstractQuestionDetailComponent,
	#category : #'Cuoora-ui'
}

{ #category : #'as yet unclassified' }
QuestionDetailComponent class >> question: aQuestion [
	^ self new
		question: aQuestion;
		yourself
]

{ #category : #accessing }
QuestionDetailComponent >> addAnswer: aQuestion [
	| add_answer_component |
	add_answer_component := AddAnswerComponent question: aQuestion.
	self call: add_answer_component.
	self answer.

]

{ #category : #rendering }
QuestionDetailComponent >> renderAnswer: anAnswer on: html [
	html
		paragraph: [ html text: 'Respuesta de: '.
			self
				renderOwnerName: anAnswer ownerName
				on: html
				with: [ self userProfile: anAnswer owner ] ].
	html paragraph: [ html text: anAnswer text ].
	self renderPostLikes: anAnswer on: html.
	html
		paragraph: [ self
				renderReactionAction: 'Like'
				on: html
				with: [ anAnswer addLike: self session user ].
			html space.
			self
				renderReactionAction: 'Dislike'
				on: html
				with: [ anAnswer addDislike: self session user ] ].
	html horizontalRule
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: html [
	super renderContentOn: html.
	question answers
		do: [ :answer | 
			self renderAnswer: answer on: html].
	html
		paragraph: [ html text: 'No hay mas respuestas'].
	html
		paragraph: [ html anchor
				callback: [ self addAnswer: question ];
				with: 'Agregar Respuesta' ].
		
]

{ #category : #rendering }
QuestionDetailComponent >> renderQuantityOfAnswers: aQuestion on: html [
		
]
