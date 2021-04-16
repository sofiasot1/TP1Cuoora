Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'user',
		'user_followed',
		'user_topic',
		'smalltalk_topic',
		'programming_topic',
		'electronic_topic'
	],
	#category : #'Cuoora-test'
}

{ #category : #tests }
CuOOraTest >> setUp [
	"Set up the CuOOra environment for testing"

	super setUp.
	cuoora := CuOOra new.
	user := User username: 'pedro' password: '123456'.
	user_followed := User username: 'juanjo' password: '123456'.
	user_topic := User username: 'juanjo_programs' password: '123456'.
	smalltalk_topic := Topic
		name: 'smalltalk'
		description: 'programming language smalltalk'.
	programming_topic := Topic
		name: 'programming'
		description: 'programming'.
	electronic_topic := Topic
		name: 'electronic'
		description: 'electronic'
]

{ #category : #tests }
CuOOraTest >> testAddTopic [
|aux |
	self assert: cuoora topics size equals: 0.
	cuoora addTopic: smalltalk_topic.
	self assert: cuoora topics size equals: 1.
	aux:=cuoora topics includes:smalltalk_topic.
	self assert:aux equals:true.
	cuoora addTopic: smalltalk_topic.
	self assert:cuoora topics size equals:1.
]

{ #category : #tests }
CuOOraTest >> testAddTopics [
	| result_topics aux |
	aux:=false.
	self assert: cuoora topics size equals: 0.
	result_topics := cuoora
		addTopics: ('OO1,Smalltalk,Programming' splitOn: ',').
	self assert: cuoora topics size equals: 3.
	self assert: result_topics size equals: 3.
	cuoora topics detect:[:each|each name='Smalltalk']ifFound:[aux:=true].
	self assert: aux equals: true.
	
]

{ #category : #tests }
CuOOraTest >> testAddUser [
|aux|
	self assert: cuoora users size equals: 0.
	cuoora addUser: user.
	self assert: cuoora users size equals: 1.
	aux:=cuoora users includes:user.
	self assert:aux equals:true.
	cuoora addUser: user.
	self assert: cuoora users size equals: 1.
]

{ #category : #tests }
CuOOraTest >> testRelevantQuestionsForUser [
	| q_progra_topics q_small_topics q_elect_topics relevant_questions q1 q2 q3 |
	q_progra_topics := OrderedCollection with: smalltalk_topic.
	q1 := Question
		withTopics: q_progra_topics
		title: 'How to use FOR'
		text: 'How does FOR works? In any language'
		user: user_followed.
	user follow: user_followed.
	self assert: (cuoora relevantQuestionsForUser: user) size equals: 1.
	q_small_topics := OrderedCollection
		with: programming_topic
		with: smalltalk_topic.
	q2 := Question
		withTopics: q_small_topics
		title: 'How does do: works?'
		text: 'Anyone can explain to me how to use this iterator?'
		user: user_topic.
	user likeTopic: programming_topic.
	relevant_questions := cuoora relevantQuestionsForUser: user.
	self assert: relevant_questions size equals: 2.
	self assert: (relevant_questions includes: q1).
	self assert: (relevant_questions includes: q2).
	user likeTopic: electronic_topic.
	relevant_questions := cuoora relevantQuestionsForUser: user.
	self assert: relevant_questions size equals: 2.
	q_elect_topics := OrderedCollection with: electronic_topic.
	q3 := Question
		withTopics: q_elect_topics
		title: 'Whats this subject?'
		text: 'I dont know what it is'
		user: user_topic.
	relevant_questions := cuoora relevantQuestionsForUser: user.
	self assert: relevant_questions size equals: 3.
	self assert: (relevant_questions includes: q3)
]

{ #category : #tests }
CuOOraTest >> testsearchForUser [
	| logged_user |
	self assert: user likedTopics size equals: 0.
	cuoora addUser: user.
	logged_user := cuoora searchForUser: 'pedro' password: '123456'.
	self assert: logged_user equals: user.
	logged_user := cuoora
		searchForUser: 'unexistent_user'
		password: '123456'.
	self assert: logged_user equals: nil
]
