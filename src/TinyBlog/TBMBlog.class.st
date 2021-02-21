Class {
	#name : #TBMBlog,
	#superclass : #Object,
	#instVars : [
		'posts',
		'uniqueInstance',
		'title',
		'adminUser'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBMBlog class >> createDemoPosts [

	"TBMBlog createDemoPosts"
	self current
		writeBlogPost: ((TBMPost title: 'Welcome in TinyBlog' text:'TinyBlog is a small blog engine made with Pharo.' category:'TinyBlog') visible: true);
		writeBlogPost: ((TBMPost title: 'Report Pharo Sprint' text:'Friday, June 12 there was a Pharo sprint / Moose dojo. It was anice event with more than 15 motivated sprinters. With the helpof candies, cakes and chocolate, huge work has been done'category: 'Pharo') visible: true);
		writeBlogPost: ((TBMPost title: 'Brick on top of Bloc -Preview' text: 'We are happy to announce the first previewversion of Brick, a new widget set created from scratch on topof Bloc. Brick is being developed primarily by Alex Syrel(together with Alain Plantec, Andrei Chis and myself), and thework is sponsored by ESUG.
		Brick is part of the Glamorous Toolkit effort and will providethe basis for the new versions of the development tools.'category: 'Pharo') visible: true);
		writeBlogPost: ((TBMPost title: 'The sad story of unclassifiedblog posts' text: 'So sad that I can read this.') visible: true);
		writeBlogPost: ((TBMPost title: 'Working with Pharo on theRaspberry Pi' text: 'Hardware is getting cheaper and many newsmall devices like the famous Raspberry Pi provide newcomputation power that was one once only available on regulardesktop computers.' category: 'Pharo') visible: true)
]

{ #category : #testing }
TBMBlog class >> current [ 
	^ self selectAll 
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [  self new save ]

]

{ #category : #'as yet unclassified' }
TBMBlog class >> defaultAdminLogin [
	^ 'admin' 
]

{ #category : #'as yet unclassified' }
TBMBlog class >> defaultAdminPassword [
	^ 'topsecret' 
]

{ #category : #testing }
TBMBlog class >> initialize [ 
	self reset 


]

{ #category : #testing }
TBMBlog class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton 
]

{ #category : #testing }
TBMBlog class >> isVoyageRoot [ 
	"Indicates that instances of this class are top level documents in noSQL databases"
	^ true
]

{ #category : #testing }
TBMBlog class >> reset [ 
	self initializeVoyageOnMemoryDB

]

{ #category : #'as yet unclassified' }
TBMBlog >> administrator [
	^ adminUser 
]

{ #category : #'as yet unclassified' }
TBMBlog >> allBlogPosts [
	
	^ posts
]

{ #category : #'as yet unclassified' }
TBMBlog >> allBlogPostsFromCategory: aString [ 
	
	^ posts select: [  :po | po category = aString ]
]

{ #category : #'as yet unclassified' }
TBMBlog >> allCategories [

	^ (self allBlogPosts collect: [ :p | p category]) asSet 
]

{ #category : #'as yet unclassified' }
TBMBlog >> allVisibleBlogPosts [

	^ posts select: [  :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
TBMBlog >> allVisibleBlogPostsFromCategory: aCategory [

	^ posts select: [  :p | p category = aCategory  and: [ p isVisible  ] ]
]

{ #category : #'as yet unclassified' }
TBMBlog >> createAdministrator [
	^ TBMAdminstrator 
		login: self class defaultAdminLogin 
		password: self class defaultAdminPassword 
]

{ #category : #initialization }
TBMBlog >> initialize [ 

	super initialize.
	posts := OrderedCollection new.
	title := 'Title by default of TinyBlog'.
	adminUser := self createAdministrator 
]

{ #category : #removing }
TBMBlog >> removeAllPost [

	posts := OrderedCollection new.
	self save.
]

{ #category : #removing }
TBMBlog >> removeBlogPost: aPost [

	posts remove: aPost ifAbsent: [ ].
	self save.
]

{ #category : #writing }
TBMBlog >> size [ 

	^ posts size
]

{ #category : #accessing }
TBMBlog >> title [ 
	^ title
]

{ #category : #accessing }
TBMBlog >> title: aWord [ 
	title := aWord
]

{ #category : #writing }
TBMBlog >> writeBlogPost: aPost [
	"Write the blog post in database"
	self allBlogPosts add: aPost.
	self save
]
