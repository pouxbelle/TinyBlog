Class {
	#name : #TBMPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #initialization }
TBMPostComponent >> date [ 
	^ post date 
]

{ #category : #initialization }
TBMPostComponent >> initialize [ 
	super initialize.
	post := TBMPost new
]

{ #category : #'as yet unclassified' }
TBMPostComponent >> post: aTBMPost [ 
	post := aTBMPost
]

{ #category : #initialization }
TBMPostComponent >> renderContentOn: html [ 
	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self text
]

{ #category : #initialization }
TBMPostComponent >> text [ 
	^ post text 
]

{ #category : #initialization }
TBMPostComponent >> title [ 
	^ post title 
]
