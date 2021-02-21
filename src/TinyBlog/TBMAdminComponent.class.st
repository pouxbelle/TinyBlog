Class {
	#name : #TBMAdminComponent,
	#superclass : #TBMScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBMAdminComponent >> children [ 
	^ super children copyWith: self report 
]

{ #category : #initialization }
TBMAdminComponent >> createHeaderComponent [ 
	^ TBMAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> goToPostListView [
	self answer 
]

{ #category : #accessing }
TBMAdminComponent >> initialize [ 
	super initialize.
	self report: (TBMPostsReport from: self blog)
]

{ #category : #'as yet unclassified' }
TBMAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ 
		html heading: 'Blog Admin'.
		html horizontalRule.
		html render: self report ]
]

{ #category : #accessing }
TBMAdminComponent >> report [ 
	^ report 
]

{ #category : #accessing }
TBMAdminComponent >> report: aReport [
	report := aReport 
]
