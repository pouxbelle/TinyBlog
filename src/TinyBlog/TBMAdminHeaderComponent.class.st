Class {
	#name : #TBMAdminHeaderComponent,
	#superclass : #TBMHeaderrComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBMAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ 
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
TBMAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
		tbsPullRight;
		callback: [ self session reset ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
TBMAdminHeaderComponent >> renderPublicViewButtonOn: html [
	self session isLogged ifTrue: [ 
		html tbsNavbarButton 
			tbsPullRight;
			callback: [ component goToPostListView ];
			with: [ 
				html tbsGlyphIcon iconEyeOpen .
				html text: ' Public View ' ] ]
]
