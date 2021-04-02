Class {
	#name : #AbstractQuestionDetailComponent,
	#superclass : #AbstractUserHomeComponent,
	#instVars : [
		'question'
	],
	#category : #'Cuoora-ui'
}

{ #category : #accessing }
AbstractQuestionDetailComponent >> question: aQuestion [
	question := aQuestion.
]

{ #category : #rendering }
AbstractQuestionDetailComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	self renderQuestionDetail: html.
 
]

{ #category : #rendering }
AbstractQuestionDetailComponent >> renderQuestionDetail: html [
	html
		tableRow: [ self
				renderPostText: question
				on: html
				with: [ self questionDetail: question ].
			self renderQuestionTopics: question on: html.
			html
				paragraph: [ self
						renderOwnerName: question ownerName
						on: html
						with: [ self userProfile: question owner ] ].
			self renderPostLikes: question on: html.
			html
				paragraph: [ self
						renderReactionAction: 'Like'
						on: html
						with: [ question addLike: self session user ].
					html space.
					self
						renderReactionAction: 'Dislike'
						on: html
						with: [ question addDislike: self session user ] ].
			html horizontalRule ]
]
