Class {
	#name : #TopicTest,
	#superclass : #TestCase,
	#instVars : [
		'topic1',
		'q1',
		'q2'
	],
	#category : #'Cuoora-test'
}

{ #category : #running }
TopicTest >> setUp [
	super setUp.
	topic1 := Topic name: 'smalltalk' description: 'programming language smalltalk'.
	q1 := Question new.
	q2 := Question new.
	
	
]

{ #category : #tests }
TopicTest >> testAddQuestion [
	self assert: topic1 questions size equals: 0.
	topic1 addQuestion: q1.
	self assert: topic1 questions size equals: 1.
	topic1 addQuestion: q2.
	self assert: topic1 questions size equals: 2.
]

{ #category : #running }
TopicTest >> testRemoveQuestion [
	topic1 addQuestion: q1.
	topic1 addQuestion: q2. 
	self assert: topic1 questions size equals: 2.
	topic1 removeQuestion: q1.
	self assert: topic1 questions size equals: 1.
	topic1 removeQuestion: q2.
	self assert: topic1 questions size equals: 0.
	topic1 removeQuestion: q1.
	self assert: topic1 questions size equals: 0.
]
