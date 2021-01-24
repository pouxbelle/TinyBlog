Class {
	#name : #TBMPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBMPostTest >> testPostIsCreatedCorrectly [

	| post |
	post := TBMPost 
		title: 'Welcome in TinyBlog'
		text: 'TinyBlog is a small blog engine with Pharo'
		category: 'TinyBlog'.
	self assert: post title equals: 'Welcome in TinyBlog'.
	self assert: post text equals: 'TinyBlog is a small blog engine with Pharo'.
	self assert: post category equals: 'TinyBlog'
]

{ #category : #tests }
TBMPostTest >> testWithoutCategoryIsUnclassified [

	| post |
	post := TBMPost 
		title: 'Welcome in TinyBlog'
		text: 'TinyBlog is a small blog engine with Pharo'.
	self assert: post title equals: 'Welcome in TinyBlog'.
	self assert: post text equals: 'TinyBlog is a small blog engine with Pharo'.
	self assert: post category equals: TBMPost unclassifiedTag 
]

{ #category : #tests }
TBMPostTest >> testWithoutCategoryIsUnclassified2 [

	| post |
	post := TBMPost 
		title: 'Welcome in TinyBlog'
		text: 'TinyBlog is a small blog engine with Pharo'.
	self assert: post title equals: 'Welcome in TinyBlog'.
	self assert: post text equals: 'TinyBlog is a small blog engine with Pharo'.
	self assert: post isUnclassified.
	self deny: post isVisible 
]
