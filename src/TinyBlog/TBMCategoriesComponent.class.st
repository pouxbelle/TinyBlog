Class {
	#name : #TBMCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBMCategoriesComponent class >> categories: categories postsList: aTBMScreen [
	^ self new categories: categories; postsList: aTBMScreen
]

{ #category : #accessing }
TBMCategoriesComponent >> categories [ 
	^ categories 
]

{ #category : #accessing }
TBMCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection 
]

{ #category : #accessing }
TBMCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
TBMCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
TBMCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [ 
	html tbsLinkifyListGroupItem
		class: 'active' if: aCategory = self postsList currentCategory;
		callback: [ self selectCategory: aCategory ];
		with: aCategory 
]

{ #category : #rendering }
TBMCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [ 
		html tbsListGroupItem 
			with: [ html strong: 'Categories' ].
		categories do: [ :cat | self renderCategoryLinkOn: html with: cat ] ] 
]

{ #category : #'as yet unclassified' }
TBMCategoriesComponent >> selectCategory: aCategory [ 
	postsList currentCategory: aCategory 
]
