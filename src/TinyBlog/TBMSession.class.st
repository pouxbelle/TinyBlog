Class {
	#name : #TBMSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBMSession >> currentAdmin [
	^ currentAdmin
]

{ #category : #accessing }
TBMSession >> currentAdmin: anObject [
	currentAdmin := anObject
]

{ #category : #accessing }
TBMSession >> isLogged [
	^ self currentAdmin notNil
]

{ #category : #initialization }
TBMSession >> reset [ 
	currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
