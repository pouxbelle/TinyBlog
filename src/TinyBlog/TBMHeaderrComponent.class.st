Class {
	#name : #TBMHeaderrComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBMHeaderrComponent >> renderBrandOn: html [ 
	html tbsNavbarHeader: [ html tbsNavbarBrand url: self application url; with: TBMBlog current title ]
]

{ #category : #rendering }
TBMHeaderrComponent >> renderContentOn: html [ 
	html tbsNavbar beDefault; with: [ html tbsContainer: [ self renderBrandOn: html ] ]
]
