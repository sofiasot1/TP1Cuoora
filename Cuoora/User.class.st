"
I'm a CuOOra app user.

I know the questions and answers I've made, know my registration data, the topics and users I follow.For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

I can calculate my score, give information about my questions and answers and delete a question I've made.

Collaborators:
- Questions
- Answers
- 
"
Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'registerDate',
		'registerTime',
		'followed',
		'answers',
		'reactions',
		'likedTopics',
		'questions'
	],
	#category : #'Cuoora-model'
}

{ #category : #'instance creation' }
User class >> username: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #actions }
User >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #accessing }
User >> answers [
	^ answers
]

{ #category : #actions }
User >> follow: aUser [
	followed
		detect: [ :each | each username == aUser username ]
		ifFound: [ ^ nil ]
		ifNone: [ followed add: aUser ]
]

{ #category : #accessing }
User >> followed [
	^ followed
]

{ #category : #initialization }
User >> initialize [
	registerDate := Date today.
	registerTime := DateAndTime now.
	followed := OrderedCollection new.
	reactions := OrderedCollection new.
	likedTopics := OrderedCollection new.
	questions := OrderedCollection new.
	answers := OrderedCollection new
]

{ #category : #actions }
User >> likeTopic: aTopic [
	 likedTopics  detect:[ :each | each == aTopic]
				ifNone: [ likedTopics add: aTopic ].
	
]

{ #category : #accessing }
User >> likedTopics [
	^ likedTopics
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #'as yet unclassified' }
User >> registerAnswer: anAnswer [
	answers add: anAnswer.
]

{ #category : #actions }
User >> removeAnswer: anAnswer [
	answers remove: anAnswer
]

{ #category : #actions }
User >> removeQuestion: aQuestion [
	questions remove: aQuestion
]

{ #category : #calculating }
User >> score [
	"Calculates and returns the score of a User.
	20 points per question, 50 points per answer and
	the score of each of them."

	| totalScore finalAnswers |
	finalAnswers := answers
		reject: [ :each | each question owner == self ].
	totalScore := questions inject: 0 into: [ :sum :q | q score ].
	totalScore := totalScore
		+ (answers inject: 0 into: [ :sum :ans | ans score ]).
	totalScore := totalScore + (questions size * 20).
	totalScore := totalScore + (finalAnswers size * 50).
	^ totalScore
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #'instance creation' }
User >> username: aUsername password: aPassword [
	username := aUsername.
	password := aPassword
]
