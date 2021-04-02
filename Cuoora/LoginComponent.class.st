"
Register application with the following expression: 

WAAdmin register: LoginComponent asApplicationAt: 'cuoora.com'
"
Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password',
		'cuoora'
	],
	#category : #'Cuoora-ui'
}

{ #category : #initialization }
LoginComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance sampleData.
]

{ #category : #callbacks }
LoginComponent >> login [
	| logged_user home_component|
	logged_user := cuoora loginWith: username password: password.
	logged_user ifNotNil:  [ 
			self session user: logged_user.
			home_component := UserHomeComponent new.
			self call: home_component.
		 ]
	
]

{ #category : #accessing }
LoginComponent >> password [
	^password 
]

{ #category : #accessing }
LoginComponent >> password: aPassword [
	password := aPassword
]

{ #category : #rendering }
LoginComponent >> renderContentOn: html [

	html heading level1; with: 'CuOOra'.
	html horizontalRule.
	html break.
	
	html
		form: [ html
				paragraph: [ html label: 'Usuario: '.
					html textInput on: #username of: self ].
			html
				paragraph: [ html label: 'Contraseña: '.
					html passwordInput on: #password of: self ].
			html button
				callback: [ self login ];
				with: 'Iniciar Sesion'.]
]

{ #category : #accessing }
LoginComponent >> username [
	^username 
]

{ #category : #accessing }
LoginComponent >> username: aUsername [
	username := aUsername
]
