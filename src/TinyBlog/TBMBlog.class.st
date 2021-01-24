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

{ #category : #initialization }
TBMBlog >> initialize [ 

	super initialize.
	posts := OrderedCollection new.
]

{ #category : #removing }
TBMBlog >> removeAllPost [

	posts := OrderedCollection new
]

{ #category : #writing }
TBMBlog >> size [ 

	^ posts size
]

{ #category : #writing }
TBMBlog >> writeBlogPost: aPost [

	"Add the blog post to the list of posts"
	posts add: aPost
]
