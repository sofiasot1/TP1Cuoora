Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'text',
		'owner',
		'likes',
		'dislikes'
	],
	#category : #'Cuoora-model'
}

{ #category : #'as yet unclassified' }
Post class >> withOwner:aUser andText: aText [

^self new withOwner:aUser andText: aText.

]

{ #category : #accessing }
Post >> <= anotherQuestion [
	^self creationDate <= anotherQuestion creationDate.
	
]

{ #category : #actions }
Post >> addDislike: aUser [
	"adds reaction to collection of dislikes"
	| detect_block new_reaction |
	
	new_reaction:= Reaction withUser: aUser.
	detect_block := [:reaction | reaction isEqualTo: new_reaction].
	dislikes
   		detect: detect_block
   		ifNone: [ dislikes add: new_reaction ].
	likes := likes reject: detect_block.
]

{ #category : #actions }
Post >> addLike: aUser [
	"adds user to collection of users"
	| detect_block new_reaction |
	new_reaction:= Reaction withUser: aUser.
	detect_block := [:reaction | reaction isEqualTo: new_reaction].
	likes
   		detect: detect_block
   		ifNone: [ likes add: new_reaction ].
	dislikes:= dislikes reject: detect_block.
]

{ #category : #accessing }
Post >> creationDate [
	^creationDate.
]

{ #category : #accessing }
Post >> dislikes [
	^dislikes size
]

{ #category : #initialization }
Post >> initialize [
	"initializes instance variables"

	creationTime := DateAndTime now.
	creationDate := Date today.
	likes := Set new.
	dislikes := Set new
]

{ #category : #accessing }
Post >> likes [
	^likes size
]

{ #category : #accessing }
Post >> owner [ 
	^owner
]

{ #category : #accessing }
Post >> owner: anOwner [

	owner := anOwner
]

{ #category : #accessing }
Post >> ownerName [
	^owner username.
]

{ #category : #accessing }
Post >> score [ 
	^likes size - dislikes size
]

{ #category : #accessing }
Post >> text [ 
	^text
]

{ #category : #accessing }
Post >> text: aText [
	
	text := aText
]

{ #category : #'as yet unclassified' }
Post >> withOwner: aUser andText: aText [
	owner := aUser.
	text := aText
]
