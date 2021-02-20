Class {
	#name : #TBMHeaderrComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBMHeaderrComponent class >> from: aComponent [
	^ self new 
	component: aComponent ;
	yourself 
]

{ #category : #accessing }
TBMHeaderrComponent >> component [
	^ component
]

{ #category : #accessing }
TBMHeaderrComponent >> component: anObject [
	component := anObject
]

{ #category : #rendering }
TBMHeaderrComponent >> renderBrandOn: html [ 
	html tbsNavbarHeader: [ html tbsNavbarBrand url: self application url; with: TBMBlog current title ]
]

{ #category : #rendering }
TBMHeaderrComponent >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ self renderSimpleAdminButtonOn: html ]
		ifFalse: [ self renderModalLoginButtonOn: html ]
]

{ #category : #rendering }
TBMHeaderrComponent >> renderContentOn: html [ 
	html tbsNavbar beDefault; with: [
		html tbsContainer: [ 
			self renderBrandOn: html.
			self renderButtonsOn: html
	 ] ]
]

{ #category : #rendering }
TBMHeaderrComponent >> renderModalLoginButtonOn: html [
	html render: (TBMAuthentificationComponent from: component).
	html tbsNavbarButton
		tbsPullRight;
		attributeAt: 'data-target' put: '#myAuthDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [
			html tbsGlyphIcon iconLock.
			html text: ' Login' ]
]

{ #category : #rendering }
TBMHeaderrComponent >> renderSimpleAdminButtonOn: html [
	html form: [ 
		html tbsNavbarButton 
			tbsPullRight;
			callback: [ component goToAdministrationView ];
			with: [ 
				html tbsGlyphIcon iconListAlt.
				html text: 'Admin View' ] ]
]
