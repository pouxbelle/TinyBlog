Class {
	#name : #TBMAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBMAuthentificationComponent class >> from: aComponent [
	^ self new 
		component: aComponent;
		yourself 
]

{ #category : #accessing }
TBMAuthentificationComponent >> account [
	^ account
]

{ #category : #accessing }
TBMAuthentificationComponent >> account: anObject [
	account := anObject
]

{ #category : #accessing }
TBMAuthentificationComponent >> component [ 
	^ component 
]

{ #category : #accessing }
TBMAuthentificationComponent >> component: anObject [
	component  := anObject
]

{ #category : #accessing }
TBMAuthentificationComponent >> password [
	^ password
]

{ #category : #accessing }
TBMAuthentificationComponent >> password: anObject [
	password := anObject
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderAccountFieldOn: html [
	html
		tbsFormGroup: [ html label with: 'Account'.
			html textInput
				tbsFormControl;
				attributeAt: 'autofocus' put: 'true';
				callback: [ :value | account := value ];
				value: account ]
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderBodyOn: html [.
	html
		tbsModalBody: [
			html tbsForm: [ 
				self renderAccountFieldOn: html.
				self renderPasswordFieldOn: html.
				html tbsModalFooter: [ self renderButtonsOn: html ]
	 ] ]
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderButtonsOn: html [
	html tbsButton
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Cancel'.
	html tbsSubmitButton
		bePrimary;
		callback: [ self validate ];
		value: 'SignIn'
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderContentOn: html [ 
	html tbsModal 
		id: 'myAuthDialog';
		with: [ 
			html tbsModalDialog: [ 
				html tbsModalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html  ] ] ]
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderHeaderOn: html [.
	html
		tbsModalHeader: [ 
			html tbsModalCloseIcon.
			html tbsModalTitle 
				level: 4;
				with: 'Authentication' ]
]

{ #category : #rendering }
TBMAuthentificationComponent >> renderPasswordFieldOn: html [
	html
		tbsFormGroup: [
			html label with: 'Password'.
			html passwordInput
				tbsFormControl;
				callback: [ :value | password := value ];
				value: password ]
]

{ #category : #rendering }
TBMAuthentificationComponent >> validate [
	^ component tryConnectionWithLogin: self account andPassword: self password
]
