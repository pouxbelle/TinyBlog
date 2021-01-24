Class {
	#name : #TBMBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #'initialization widgets' }
TBMBlogTest >> setup [
	
	blog := TBMBlog current.
	blog removeAllPost.
	
	first := TBMPost title: 'A title' text: 'A text'  category: 'First Category'.
	blog writeBlogPost: first.
	
	post := (TBMPost title: 'Another title' text: 'Another text' category: 'Second Category') beVisible 
]

{ #category : #'initialization widgets' }
TBMBlogTest >> tearDown [ 

	TBMBlog reset
]

{ #category : #'initialization widgets' }
TBMBlogTest >> testAddBlogPost [

	blog writeBlogPost: post.
	self assert: blog size equals: 2
]
