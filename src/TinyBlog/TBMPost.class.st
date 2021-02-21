Class {
	#name : #TBMPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #'instance creation' }
TBMPost class >> title: aTitle text: aText [

	^ self new 
		title: aTitle ;
		text: aText;
		yourself 
]

{ #category : #'instance creation' }
TBMPost class >> title: aTitle text: aText category: aCategory [ 

	^ (self title: aTitle text: aText)
		category: aCategory ;
		yourself 
]

{ #category : #'as yet unclassified' }
TBMPost class >> unclassifiedTag [

	^ 'Unclassified'
]

{ #category : #blinking }
TBMPost >> beVisible [ 

	self visible: true
]

{ #category : #accessing }
TBMPost >> category [  
	
	^ category
]

{ #category : #accessing }
TBMPost >> category: anObject [ 
	
	category := anObject
]

{ #category : #accessing }
TBMPost >> date [ 
	
	^ date
]

{ #category : #accessing }
TBMPost >> date: aDate [  
	
	date := aDate
]

{ #category : #'acessing-magritte' }
TBMPost >> descriptionCategory [
<magritteDescription>
^ MAStringDescription new 
	label: 'Category';
	priority: 300;
	accessor: #category;
	comment: 'Unclassified if empty';
	componentClass: TBSMagritteTextInputComponent;
	yourself 
]

{ #category : #'magritte descriptions' }
TBMPost >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #'acessing-magritte' }
TBMPost >> descriptionDate [
<magritteDescription>
^ MADateDescription new 
	label: 'Date';
	priority: 400;
	accessor: #date;
	beRequired;
	yourself 
]

{ #category : #'acessing-magritte' }
TBMPost >> descriptionText [
<magritteDescription>
^ MAMemoDescription new 
	label: 'Text';
	priority: 200;
	accessor: #text;
	beRequired;
	requiredErrorMessage: 'A blog post must contain a text.';
	comment: 'Please enter a text';
	componentClass: TBSMagritteTextAreaComponent;
	yourself 
]

{ #category : #'acessing-magritte' }
TBMPost >> descriptionTitle [
<magritteDescription>
^ MAStringDescription new 
	label: 'Title';
	priority: 100;
	accessor: #title;
	requiredErrorMessage: 'A blog post must have a title.';
	comment: 'Please enter a title';
	componentClass: TBSMagritteTextInputComponent;
	beRequired;
	yourself 
]

{ #category : #'acessing-magritte' }
TBMPost >> descriptionVisible [ 
<magritteDescription>
^ MABooleanDescription new 
	checkboxLabel: 'Visible';
	priority: 500;
	accessor: #visible;
	componentClass: TBSMagritteCheckboxComponent;
	beRequired;
	yourself 
]

{ #category : #initialization }
TBMPost >> initialize [ 

	super initialize.
	self category: self class unclassifiedTag.
	self date: Date today.
	self notVisible
]

{ #category : #blinking }
TBMPost >> isUnclassified [

	^ self category = self class unclassifiedTag 
]

{ #category : #blinking }
TBMPost >> isVisible [ 

	^ self visible
]

{ #category : #blinking }
TBMPost >> notVisible [ 

	self visible: false
]

{ #category : #accessing }
TBMPost >> text [ 
	
	^ text
]

{ #category : #accessing }
TBMPost >> text: aString [
	
	text := aString
]

{ #category : #accessing }
TBMPost >> title [ 
	
	^ title
]

{ #category : #accessing }
TBMPost >> title: aString [ 
	
	title := aString 
]

{ #category : #accessing }
TBMPost >> visible [  
	
	^ visible
]

{ #category : #accessing }
TBMPost >> visible: aBoolean [
	
	visible := aBoolean 
]
