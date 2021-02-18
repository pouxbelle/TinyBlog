Class {
	#name : #TBMScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBMScreenComponent >> blog [
	"Return the current blog. In the future we will ask the session to return the blog of the currently logged in user"
	^ TBMBlog current 
]

{ #category : #initialization }
TBMScreenComponent >> children [ 
	^ {  header }
]

{ #category : #initialization }
TBMScreenComponent >> createHeaderComponent [
	^ TBMHeaderrComponent new 
]

{ #category : #initialization }
TBMScreenComponent >> initialize [ 
	super initialize.
	header := self createHeaderComponent
]

{ #category : #'as yet unclassified' }
TBMScreenComponent >> renderContentOn: html [ 
	html render: header
]
