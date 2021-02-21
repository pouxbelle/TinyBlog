Class {
	#name : #TBMPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBMPostsReport class >> filteredDescriptionsFrom: aBlogPost [
"Filter only some descriptions for the report columns."
^ aBlogPost magritteDescription
	select: [ :each | #(title category date) includes: each accessor
		selector ]
]

{ #category : #'instance creation' }
TBMPostsReport class >> from: aBlog [
	| report blogPosts |
	blogPosts := aBlog allBlogPosts.
	report := self rows: blogPosts description: (self
	filteredDescriptionsFrom: blogPosts anyOne).
	report blog: aBlog.
	report addColumn: (MACommandColumn new
		addCommandOn: report selector: #viewPost: text: 'View';
	yourself;
		addCommandOn: report selector: #editPost: text: 'Edit';
	yourself;
		addCommandOn: report selector: #deletePost: text: 'Delete';
	yourself).
	^ report
]

{ #category : #rendering }
TBMPostsReport >> addPost [
	| post |
	post := self call: (self renderAddPostForm: TBMPost new).
	post ifNotNil: [  blog writeBlogPost: post.
			self refreshReport ]
]

{ #category : #accessing }
TBMPostsReport >> blog [
	^ blog
]

{ #category : #accessing }
TBMPostsReport >> blog: aTBMBlog [
	blog := aTBMBlog 
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> deletePost: aPost [
	(self confirm: 'Do you want remove this post ?')
		ifTrue: [ blog removeBlogPost: aPost ]
]

{ #category : #rendering }
TBMPostsReport >> editPost: aPost [
	| post |
	post := self call: (self renderEditPostForm: aPost).
	post ifNotNil: [ blog save ]
]

{ #category : #'as yet unclassified' }
TBMPostsReport >> refreshReport [
	self rows: blog allBlogPosts.
	self refresh.
]

{ #category : #rendering }
TBMPostsReport >> renderAddPostForm: aPost [
	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save
	-> 'Add post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
TBMPostsReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addPost ];
		with: 'Add post'.
	super renderContentOn: html
]

{ #category : #rendering }
TBMPostsReport >> renderEditPostForm: aPost [
	^ aPost asComponent addDecoration: (
		TBSMagritteFormDecoration buttons: {
			#save -> 'Save post'.
			#cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
TBMPostsReport >> renderViewPostForm: aPost [
	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #cancel
	-> 'Back' });
		readonly: true;
		yourself 
]

{ #category : #rendering }
TBMPostsReport >> viewPost: aPost [
	self call: (self renderViewPostForm: aPost)
]
