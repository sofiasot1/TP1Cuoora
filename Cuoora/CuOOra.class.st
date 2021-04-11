"
I represent a questions and answers application.

I know all of my users and topics and can provide relevant questions to my users.

Collaborators:
- Users:
- Topics: 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	topics:		<Object>
	users:		<Object>


    Implementation Points
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'topics',
		'users'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Cuoora-model'
}

{ #category : #'as yet unclassified' }
CuOOra class >> clearSoleInstance [ 
	soleInstance := nil. 
]

{ #category : #'as yet unclassified' }
CuOOra class >> resetInstance [ 
	soleInstance := self new. 
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	soleInstance ifNil: [ soleInstance := self new ].
	^soleInstance
	
]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	"adds a new topic to collection of topics"

	topics add: aTopic
]

{ #category : #adding }
CuOOra >> addTopics: aTopicList [
	"Adds the topics to the topics List, if they are not present. Returns the created/found topics"

	aTopicList
		do: [ :newTopic | 
			topics
				detect: [ :topic | topic name = newTopic  ]
				ifNone: [ topics add: (Topic name: newTopic description: '') ] ].
	^topics select:  [ :topic | aTopicList includes: (topic name) ]
]

{ #category : #adding }
CuOOra >> addUser: aUser [
	"adds a new user to collection of users"

	users add: aUser
]

{ #category : #initialization }
CuOOra >> initialize [
	"creates empty collections of users & topics"

	users:= OrderedCollection new.
	topics:= OrderedCollection new.
]

{ #category : #enumerating }
CuOOra >> loginWith: username password: password [
	^ users detect: [:user | (user username = username) and: (user password = password)] ifNone: [ nil ].
]

{ #category : #enumerating }
CuOOra >> relevantQuestionsForUser: aUser [
	| resultQuestions |
	
	resultQuestions := Set new.
	aUser likedTopics do: [ :topic | resultQuestions addAll: (topic questions) ].
	aUser followed do: [ :user | resultQuestions addAll: (user questions) ].
	
  	^ resultQuestions
]

{ #category : #accessing }
CuOOra >> sampleData [
	| pedro diego juan oo1 smalltalk unit_test pedro_pregunta diego_pregunta |
	pedro := User
		username: 'pedro@cuoora.com'
		password: 'pedro@cuoora.com'.
	diego := User
		username: 'diego@cuoora.com'
		password: 'diego@cuoora.com'.
	juan := User username: 'juan@cuoora.com' password: 'juan@cuoora.com'.
	self addUser: pedro.
	self addUser: diego.
	self addUser: juan.
	juan follow: diego.
	pedro follow: juan.
	oo1 := Topic name: 'OO1' description: 'Preguntas de OO1'.
	smalltalk := Topic
		name: 'Smalltalk'
		description: 'Preguntas de Smalltalk'.
	unit_test := Topic
		name: 'Test de unidad'
		description: 'Preguntas sobre tests de unidad'.
	pedro_pregunta := Question
		withTopics: (OrderedCollection with: oo1 with: unit_test)
		title: 'SetUp'
		text: '¿Para qué sirve el método SetUp?'
		user: pedro.
	diego_pregunta := Question
		withTopics: (OrderedCollection with: oo1 with: smalltalk)
		title: 'SetUp'
		text: '¿Para qué sirve el método SetUp?'
		user: diego.
	Answer
		fromOwner: diego
		withText:
			'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'
		toQuestion: pedro_pregunta.
	Answer
		fromOwner: pedro
		withText:
			'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'
		toQuestion: diego_pregunta.
	^ self
]

{ #category : #enumerating }
CuOOra >> searchForUser: username password: password [
	^ users detect: [:user | (user username = username) and: (user password = password)] ifNone: [ nil ].
]

{ #category : #accessing }
CuOOra >> topics [
	^topics
]

{ #category : #accessing }
CuOOra >> users [ 
	^users
]
