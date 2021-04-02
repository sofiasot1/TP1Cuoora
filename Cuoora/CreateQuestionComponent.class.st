Class {
	#name : #CreateQuestionComponent,
	#superclass : #AbstractUserHomeComponent,
	#instVars : [
		'titulo',
		'desarrollo',
		'topicos'
	],
	#category : #'Cuoora-ui'
}

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> cancelar [
	self answer
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> desarrollo [
	^desarrollo
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> desarrollo: aQuestionText [
	desarrollo := aQuestionText
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> guardar [
	| question_topics |
	question_topics := cuoora addTopics: (topicos splitOn: ',').
	Question
		withTopics: question_topics
		title: titulo
		text: desarrollo
		user: (self session user).
	self answer.
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> initialize [ 
	super initialize.
]

{ #category : #rendering }
CreateQuestionComponent >> renderContentOn: html [
	super renderContentOn: html.
	html heading
		level2;
		with: 'Nueva Pregunta'.
	html
		form: [ html
				paragraph: [ html label: 'Titulo '.
					html textInput size: 60; on: #titulo of: self ].
			html
				paragraph: [ html label: 'Desarrollo '.
					html textArea columns: 60; rows: 8;on: #desarrollo of: self ].
				html
				paragraph: [ html label: 'Topicos (Separados por una coma) '.
					html textInput size: 60; on: #topicos of: self ].
			html button
				callback: [ self cancelar ];
				with: 'Cancelar'.
			html space.
			html button
				callback: [ self guardar ];
				with: 'Guardar' ]

]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> titulo [
	^titulo
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> titulo: aTitle [
	titulo := aTitle
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> topicos [
	^topicos
]

{ #category : #'as yet unclassified' }
CreateQuestionComponent >> topicos: aQuestionTopics [
	topicos := aQuestionTopics
]
