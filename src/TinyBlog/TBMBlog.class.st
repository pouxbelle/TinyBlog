Class {
	#name : #TBMBlog,
	#superclass : #Object,
	#instVars : [
		'posts',
		'uniqueInstance'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #initialization }
TBMBlog class >> current [ 

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
TBMBlog class >> initialize [ 

	self reset
]

{ #category : #initialization }
TBMBlog class >> reset [ 
	uniqueInstance := nil
]

{ #category : #initialization }
TBMBlog >> initialize [ 

	super initialize.
	posts := OrderedCollection new.
]
