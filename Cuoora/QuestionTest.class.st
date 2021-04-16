Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'topics',
		'question',
		't1',
		't2',
		'answer1',
		'answer2',
		'user'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
QuestionTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	topics := OrderedCollection new.
	t1 := Topic
		name: 'pasatiempos'
		description: 'ideas para pasar el verano'.
	t2 := Topic name: 'picnics' description: 'programas para descanso'.
	topics add: t1.
	topics add: t2.
	user := User username: 'Bartolo' password: '123456'.
	question := Question
		withTopics: topics
		title: '¿Ideas de juegos y comidas para un fin de semana de calor?'
		text: 'sin plata ni permisos para viajar, necesito ideas'
		user: user
]

{ #category : #tests }
QuestionTest >> testAddAnswer [
	"protocol: #tests"

	self assert: question answers size equals: 0.
	answer1 := Answer
		fromOwner: user
		withText: 'que no te falten cartas de póker'
		toQuestion: question.
	question addAnswer: answer1.
	self
		assert: (question answers anySatisfy: [ :r | r owner username = 'Bartolo' ]).
	answer2 := Answer
		fromOwner: user
		withText: 'un buen puchero bien picante te levanta cualquier finde de calor'
		toQuestion: question.
	question addAnswer: answer2.
	self
		assert:
			(question answers
				anySatisfy: [ :r | r text includesSubstring: 'puchero' ])
]

{ #category : #tests }
QuestionTest >> testAddDisLike [
| u2 |
	self assert: question dislikes equals: 0.
	question addDislike: user.
	self assert: question dislikes equals: 1.
	u2 := User new.
	question addDislike: u2.
	self assert: question dislikes equals: 2.
	question addDislike: u2.
	self assert: question dislikes equals: 1.
]

{ #category : #tests }
QuestionTest >> testRemoveAnswer [
|aux |
   answer1:= Answer new.
   answer2:= Answer new. 
	question addAnswer: answer1.
	question addAnswer: answer2.
	self assert: question answers size equals: 2.
	question answers remove:answer1.
	self assert: question answers size equals: 1.
	aux:= question answers anySatisfy:[:each|each == answer1].
	self assert:aux equals: false.
]
