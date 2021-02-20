Class {
	#name : #TBMPostsListComponent,
	#superclass : #TBMScreenComponent,
	#instVars : [
		'currentCategory',
		'showLoginError'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> basicRenderCategoriesOn: html [
	html render: self categoriesComponent 
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> basicRenderPostsOn: html [ 
	self readSelectedPosts do: [  :p |
		html render: (self postComponentFor: p) ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> categoriesComponent [
	^ TBMCategoriesComponent 
		categories: self blog allCategories 
		postsList:  self
]

{ #category : #accessing }
TBMPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #accessing }
TBMPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject 
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> goToAdministrationView [
	self call: TBMAdminComponent new 
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> loginErrorMessage [
	^ 'Pas de bol ! Cela ne passe pas comme cela !'
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> loginErrorOccured [
	showLoginError := true
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> postComponentFor: aPost [
	^ TBMPostComponent new post: aPost
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> readSelectedPosts [
	^ self currentCategory 
		ifNil: [ self blog allVisibleBlogPosts  ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory  ]
]

{ #category : #rendering }
TBMPostsListComponent >> renderCategoryColumnOn: html [ 
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self basicRenderCategoriesOn: html ].
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		tbsContainer: [
			html tbsRow
				showGrid;
				with: [ self renderCategoryColumnOn: html.
						self renderPostColumnOn: html ] ]
]

{ #category : #rendering }
TBMPostsListComponent >> renderLoginErrorMessageIfAnyOn: html [
	self hasLoginError ifTrue: [ 
		showLoginError := false.
		html tbsAlert 
			beDanger ;
			with: self loginErrorMessage 
	 ]
]

{ #category : #rendering }
TBMPostsListComponent >> renderPostColumnOn: html [ 
		html tbsColumn
			extraSmallSize: 12;
			smallSize: 10;
			mediumSize: 8;
			with: [ 
				self renderLoginErrorMessageIfAnyOn: html.
				self basicRenderPostsOn: html ]
]

{ #category : #'as yet unclassified' }
TBMPostsListComponent >> tryConnectionWithLogin: login andPassword: password [
	(login = self blog administrator login and: [ 
		(MD5 hashMessage: password) = self blog administrator password 
	 ])
		ifTrue: [ 
			self session currentAdmin: self blog administrator. 
			self goToAdministrationView ]
		ifFalse: [ self loginErrorOccured ]
]
