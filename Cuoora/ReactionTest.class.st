Class {
	#name : #ReactionTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'question',
		'answer',
		'reaction1',
		'reaction2',
		't1',
		't2',
		'topics',
		'reaction'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
ReactionTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	user := User username: 'Bartolo' password: '123456'.
	topics := OrderedCollection new.
	t1 := Topic
		name: 'programming'
		description: 'general programming questions'.
	t2 := Topic
		name: 'smalltalk'
		description: 'programming language smalltalk'.
	topics add: t1.
	topics add: t2.
	question := Question
		withTopics: topics
		title: '¿Ideas de juegos y comidas para un fin de semana de calor?'
		text: 'sin plata ni permisos para viajar, necesito ideas'
		user: user.
	reaction := Reaction withUser: user.
]

{ #category : #tests }
ReactionTest >> testReactionOwner [
	self assert: reaction owner equals: user.
	
]
