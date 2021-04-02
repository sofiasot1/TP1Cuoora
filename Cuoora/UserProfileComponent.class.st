Class {
	#name : #UserProfileComponent,
	#superclass : #AbstractUserHomeComponent,
	#instVars : [
		'owner'
	],
	#category : #'Cuoora-ui'
}

{ #category : #accessing }
UserProfileComponent class >> owner: aProfileOwner [
	^ self new
		owner: aProfileOwner;
		yourself
]

{ #category : #accessing }
UserProfileComponent >> owner [ 
	^owner
]

{ #category : #accessing }
UserProfileComponent >> owner: aOwner [ 
	owner := aOwner.
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	super renderContentOn: html.
	html strong: 'Preguntas de: ', owner username.
   html space.
   html anchor
      callback: [ (self session user) follow: owner ];
      with: 'Follow'.
	html horizontalRule.
   html paragraph: 'Sus preguntas son: '.
   html
      table: [ owner questions
      do: [ :question | self renderQuestion: question on: html ] ].
   html
      button: [ html anchor
      callback: [ self answer ];
      with: 'Volver' ]
]

{ #category : #rendering }
UserProfileComponent >> renderPostText: aPost on: html with: aCallbackBlock [
	html paragraph: [ html strong: aPost text ]
]
