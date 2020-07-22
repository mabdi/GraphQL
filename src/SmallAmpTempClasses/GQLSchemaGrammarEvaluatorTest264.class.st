Class {
	#name : #GQLSchemaGrammarEvaluatorTest264,
	#superclass : #GQLSchemaGrammarEvaluatorTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
GQLSchemaGrammarEvaluatorTest264 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
GQLSchemaGrammarEvaluatorTest264 >> testSchemaEnumTypeExtension_amp_L8 [
	<madeBySmallAmp>
	| text enumType stringValues |
	text := 'extend enum DogCommand {YAP}'.
	schema := GQLSchemaGrammarEvaluator parse: text.
	self
		should: [ enumType := schema getTypeExtension: 'DogComand' ]
		raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
GQLSchemaGrammarEvaluatorTest264 >> testSchemaObjectTypeExtension_amp_L10 [
	<madeBySmallAmp>
	| text objectType field aCollection |
	text := 'extend type SomeType {
					someOtherField: String
				}
				extend type SomeOtherType { 
					someNumber: Int
				}'.
	aCollection := ((GQLSchemaGrammarEvaluator parse: text)
		getTypeExtension: 'SomeType') fields.
	self should: [ field := aCollection at: '' ] raise: KeyNotFound
]
