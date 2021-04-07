Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'answer',
		'user',
		'topics',
		'question'
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
	question := Question
		withTopics: topics
		title: '¿Ideas de juegos y comidas para un fin de semana de calor?'
		text: 'sin plata ni permisos para viajar, necesito ideas'
		user: user.
	answer := Answer
		fromOwner: user
		withText: 'pelopincho, tereré y crucigramas. con eso sos el Rey.'
		toQuestion: question
]
