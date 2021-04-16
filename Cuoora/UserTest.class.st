Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'answer',
		'user',
		'user_followed',
		'programming_topic',
		'topicslist',
		'topic1',
		'question2',
		'answer2'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
UserTest >> setUp [
	super setUp.
	topicslist := OrderedCollection new.
	user := User username: 'pedro' password: '123456'.
	user_followed := User username: 'juanjo' password: '123456'.
	user follow: user_followed.
	programming_topic := Topic
		name: 'programming'
		description: 'general programming questions'.
	topic1 := Topic
		name: 'smalltalk'
		description: 'programming language smalltalk'.
	topicslist add: topic1
]

{ #category : #tests }
UserTest >> testAddAnswer [
	| q a |
	q := Question
		withTopics: topicslist
		title: 'por que no pasa el test?'
		text: 'un texto'
		user: user_followed.
	self assert: q answers size equals: 0.
	a := Answer
		fromOwner: user
		withText: 'ya sé, no dije nada'
		toQuestion: q.
	self assert: user answers size equals: 1.
	self assert: user_followed answers size equals: 0.
	self assert: user answers size equals: 1
]

{ #category : #tests }
UserTest >> testAddLikedTopic [
	self assert: user likedTopics size equals: 0.
	user likeTopic: programming_topic.
	self assert: user likedTopics size equals: 1.
	self assert: (user likedTopics includes: programming_topic ) equals:true.
	user likeTopic: programming_topic.
   self assert: user likedTopics size equals: 1.
]

{ #category : #tests }
UserTest >> testAddQuestion [
	self assert: user questions size equals: 0.
	user addQuestion: question.
	self assert: user questions size equals: 1.
	self assert: (user questions includes: question) equals:true.
]

{ #category : #tests }
UserTest >> testFollow [
	self assert: user_followed followed size equals: 0.
	user_followed follow: user.
	self assert: user_followed followed size equals: 1.
	user_followed follow: user.
	self assert: user_followed followed size equals: 1.
	self assert: (user_followed followed anySatisfy:[:each|each==user ])equals:true. 
]

{ #category : #tests }
UserTest >> testScore [
	self assert: user score equals: 0.
	question := Question
		withTopics: topicslist
		title: 'sdada'
		text: 'dasdasd'
		user: user.
	answer := Answer
		fromOwner: user
		withText: 'a text'
		toQuestion: question.
	self assert: user score equals: 20.
	question2 := Question
		withTopics: topicslist
		title: 'atitle'
		text: 'dasdasd'
		user: user_followed.
	answer2 := Answer
		fromOwner: user
		withText: 'a text'
		toQuestion: question2.
	self assert: user answers size equals: 2.
	self assert: user score equals: 70.
	self assert: answer dislikes equals: 0.
	answer addDislike: user_followed.
	self assert: answer dislikes equals: 1.
	answer addDislike: user_followed.
	self assert: answer dislikes equals: 0.
	answer addDislike: user.
	self assert: answer dislikes equals: 1.
	answer addLike: user.
	self assert: answer dislikes equals: 0.
	self assert: answer likes equals: 1
	"question addLike: (Reaction withUser: user_followed).
	self assert: user score equals: 68."
]
