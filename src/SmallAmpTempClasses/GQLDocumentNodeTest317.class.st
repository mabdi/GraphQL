Class {
	#name : #GQLDocumentNodeTest317,
	#superclass : #GQLDocumentNodeTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 >> testComposeRequestIncludeWithTwoDirective_amp_L3 [
	<madeBySmallAmp>
	| response |
	self
		should: [ response := self
				attendRequest:
					'{
		films @skip(if : false) @inclue(if : true){
			name
		}
	}' ]
		raise: Error
]

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 >> testDirectiveVariable_amp_L13 [
	<madeBySmallAmp>
	| text response textVariables |
	text := '
	query operation1($name:String, $bool:Boolean){
		helloTo(name:$name) @skip(if:$bool)
	}
	'.
	textVariables := '{"name":"Alex", "bool":false}'.
	self
		should: [ response := self
				attendRequest: text
				using: 'operaton1'
				with: textVariables ]
		raise: Error
]

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 >> testSimpleRequestArgumentsIncludeWithTwoDirective_amp_L1 [
	<madeBySmallAmp>
	| response |
	self
		should: [ response := self
				attendRequest:
					'{
		helloTo(name: "Alex") @skip(if : false) @inFlude(if : true)
	}' ]
		raise: Error
]

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 >> testValidationVariablesDocument_amp_L1 [
	<madeBySmallAmp>
	| text response textVariables |
	text := '
	query operation1($naBe:String, $bool:Boolean){
		helloTo(name:$name) @skip(if:$bool)
	}
	query operation2{
		hello
	}
	'.
	textVariables := '{"name":"Alex", "bool":false}'.
	self
		should: [ response := self
				attendRequest: text
				using: 'operation2'
				with: textVariables ]
		raise: Error
]

{ #category : #'as yet unclassified' }
GQLDocumentNodeTest317 >> testValidationVariablesDocument_amp_L12 [
	<madeBySmallAmp>
	| text response textVariables |
	text := '
	query operation1($name:String, $bool:Boolean){
		helloTo(name:$name) @skip(if:$bool)
	}
	query operation2{
		hello
	}
	'.
	textVariables := '{"name":"Alex", "bool":false}'.
	self
		should: [ response := self
				attendRequest: text
				using: 'opertion2'
				with: textVariables ]
		raise: Error
]
