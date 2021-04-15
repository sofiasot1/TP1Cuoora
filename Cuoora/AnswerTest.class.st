Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'answer',
		'user',
		'topics',
		'question',
		't1',
		't2',
		'reaction'
	],
	#classInstVars : [
		'answer'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
AnswerTest >> setUp [
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
	answer := Answer fromOwner: user withText: 'sarasa' toQuestion: question.
]

{ #category : #tests }
AnswerTest >> testAddLike [
| u2 |
	self assert: answer likes equals: 0.
	answer addLike: user.
	self assert: answer likes equals: 1.
	u2 := User new.
	answer addLike: u2.
	self assert: answer likes equals: 2.
	answer addLike: u2.
	self assert: answer likes equals: 1.
]

{ #category : #tests }
AnswerTest >> testToQuestion [
	self assert: question answers size equals: 0.
	answer := Answer
		fromOwner: user
		withText: 'pelopincho, tereré y crucigramas. con eso sos el Rey.'
		toQuestion: question.
	self assert: question answers size equals: 1.
	self assert: answer question equals: question.
]
