Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'answer',
		'user',
		'user_followed',
		'programming_topic'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
UserTest >> setUp [
	super setUp.
	user := User username: 'pedro' password: '123456'.
	user_followed := User username: 'juanjo' password: '123456'.
	programming_topic  := Topic name: 'programming' description: 'general programming questions'.
	question := Question new.
	answer := Answer new.
]

{ #category : #tests }
UserTest >> testAddAnswer [
	self assert: user answers size equals: 0.
	user addQuestion: question.
	question addAnswer: answer.
	self assert: question answers size equals: 1.
]

{ #category : #tests }
UserTest >> testAddLikedTopic [
	self assert: user likedTopics size equals: 0.
	user likeTopic: programming_topic.
	self assert: user likedTopics size equals: 1.
]

{ #category : #tests }
UserTest >> testAddQuestion [
	self assert: user questions  size equals: 0.
	user addQuestion: question.
	self assert: user questions size equals: 1.
]

{ #category : #tests }
UserTest >> testCheckPassword [
	self assert: user likedTopics size equals: 0.
	user likeTopic: programming_topic.
	self assert: user likedTopics size equals: 1.
]

{ #category : #tests }
UserTest >> testFollow [
	self assert: user followed size equals: 0.
	user follow: user_followed.
	self assert: user followed size equals: 1
]

{ #category : #tests }
UserTest >> testScore [
	self assert: user score equals: 0.
	question addAnswer: answer.
	user addQuestion: question.
	user registerAnswer: answer  toQuestion: question .
	self assert: user score equals: 70.
	question addAnswer: answer.
	user addQuestion: question.
	user registerAnswer: answer toQuestion: question .
	self assert: user score equals: 140.
	'user addQuestion: question.
	self assert: user score equals: 70.
	answer addDislike: (Reaction withUser: user).
	self assert: user score equals: 69.
	answer addDislike: (Reaction withUser: user_followed).
	self assert: user score equals: 68.
	question addLike: (Reaction withUser: user_followed).
	self assert: user score equals: 69.'
]
