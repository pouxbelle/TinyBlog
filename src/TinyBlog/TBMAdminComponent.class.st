Class {
	#name : #TBMAdminComponent,
	#superclass : #TBMScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #initialization }
TBMAdminComponent >> createHeaderComponent [ 
	^ TBMAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> goToPostListView [
	self answer 
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> rendeContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ 
		html heading: 'Blog Admin'.
		html horizontalRule ]
]
