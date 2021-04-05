"
|app|
app := WAAdmin register: LoginComponent asApplicationAt: 'cuoora'.
app sessionClass: CuooraSession.
"
Class {
	#name : #AbstractUserHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora'
	],
	#category : #'Cuoora-ui'
}

{ #category : #initialization }
AbstractUserHomeComponent >> initialize [ 
	super initialize.
	cuoora := CuOOra soleInstance.
]

{ #category : #'as yet unclassified' }
AbstractUserHomeComponent >> questionDetail: aQuestion [
	|question_detail_component|
	question_detail_component := QuestionDetailComponent question: aQuestion.
	self call: question_detail_component.
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderContentOn: html [
	self renderHeader: html.
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderHeader: html [
	html
		div:
			[ html heading
				level1;
				with: 'CuOOra'.
			html strong: self session user username.
			html
				paragraph: [ html anchor
						callback: [ self session presenter home ];
						with: 'Log Out' ] ].
			html horizontalRule.
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderOwnerName: aOwnerName on: html with: aCallbackBlock [
	html anchor
		callback: aCallbackBlock;
		with: aOwnerName.
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderPostLikes: aPost on: html [
	html
		paragraph: [ html text: aPost likes.
			html text: ' Likes | '.
			html text: aPost dislikes.
			html text: ' Dislikes' ]
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderPostText: aPost on: html with: aCallbackBlock [
	html
		paragraph: [ html anchor
				callback: aCallbackBlock;
				with: aPost text ]
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderQuantityOfAnswers: question on: html [
	html text: ' | '.
	html text: question answers size.
	html text: ' Respuestas'
]

{ #category : #'as yet unclassified' }
AbstractUserHomeComponent >> renderQuestion: question on: html [
	html
		tableRow: [ 
			self renderPostText: question on: html with: [ self questionDetail: question ].
			self renderQuestionTopics: question on: html.
			html
				paragraph: [ 
					self renderOwnerName: (question ownerName) on: html with: [ self userProfile: question owner ].
					self renderQuantityOfAnswers: question on: html].
			self renderPostLikes: question  on: html. 
			html
				paragraph: [
					self renderReactionAction: 'Like' on: html  with: [ question addLike: self session user].
					html space.
					self renderReactionAction: 'Dislike' on: html  with: [ question addDislike: self session user]
					].
			html horizontalRule.].
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderQuestionTopics: aQuestion on: html [
	html
		paragraph: [ html text: 'Topicos: '.
			aQuestion topics
				do: [ :topic | 
					html
						text: topic name;
						text: ', ' ] ]
]

{ #category : #rendering }
AbstractUserHomeComponent >> renderReactionAction: anAction on: html with: aCallbackBlock [
	html anchor
		callback: aCallbackBlock;
		with: anAction
]

{ #category : #'as yet unclassified' }
AbstractUserHomeComponent >> style [
 	^'.nav li {
  		display: inline-block;
  		font-size: 20px;
  		padding: 20px;
	}'
]

{ #category : #'as yet unclassified' }
AbstractUserHomeComponent >> userProfile: profileOwner [ 
	|user_profile_component|
	user_profile_component := UserProfileComponent owner: profileOwner.
	self call: user_profile_component.
]
