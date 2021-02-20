Class {
	#name : #TBMAdminstrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBMAdminstrator class >> login: login password: password [
	^ self new
		login: login;
		password: password;
		yourself
]

{ #category : #accessing }
TBMAdminstrator >> login [ 	
	^ login
]

{ #category : #accessing }
TBMAdminstrator >> login: anObject [ 	
	login := anObject
]

{ #category : #accessing }
TBMAdminstrator >> password [ 
	^ password 
]

{ #category : #accessing }
TBMAdminstrator >> password: anObject [ 	
	password := MD5 hashMessage: anObject
]
