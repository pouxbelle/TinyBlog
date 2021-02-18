Class {
	#name : #TBMApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #testing }
TBMApplicationRootComponent class >> canBeRoot [ 
	^ true
]

{ #category : #'class initialization' }
TBMApplicationRootComponent class >> initialize [
	"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app
		addLibrary: JQDeploymentLibrary ;
		addLibrary: JQUiDeploymentLibrary ;
		addLibrary: TBSDeploymentLibrary 
]

{ #category : #rendering }
TBMApplicationRootComponent >> children [ 
	^ {  main }
]

{ #category : #initialization }
TBMApplicationRootComponent >> initialize [ 
	super initialize.
	main := TBMPostsListComponent new 
]

{ #category : #accessing }
TBMApplicationRootComponent >> main: aComponent [
	main := aComponent 
]

{ #category : #rendering }
TBMApplicationRootComponent >> renderContentOn: html [ 
	html render: main
]

{ #category : #rendering }
TBMApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
