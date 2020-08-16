Class {
	#name : #GQLSSchemaNodeTest243,
	#superclass : #GQLSSchemaNodeTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testEvaluate_amp_L5 [
	<madeBySmallAmp>
	| typeA argument |
	typeA := (self
		parseSchema:
			'type A {
								b (id: Int): B
								c (p1: [Int], p2:String): [Int]
								d (param:String)	:String 
							},
							type B {
								someName 	: [String ! ]
								someName 	:String 
							}') getType: ''.
	self should: [ typeA getField: 'd' ] raise: MessageNotUnderstood
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateInterfaceTypeExtension_amp [
	"I test correctness of: 

- `^ query` in method: `GQLSSchemaNode >> #query` when {#query->nil}

"

	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface OtherInterface{
							id: String
						}'.
	self	assert: schema query isNil.
	self parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface RelevantData{
							name: String
							id: String
						}';
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm implements NamedEntity{
							name: String
						}'.
	valid := (self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm{
							filmName: String
						}
						extend type GQLTestFilm implements NamedEntity{
							id: String
						}') validate
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateInterfaceTypeExtension_amp_A1 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface OtherInterface{
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface RelevantData{
							name: String
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm implements NamedEntity{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm{
							filmName: String
						}
						extend type GQLTestFilm implements NamedEntity{
							id: String
						}'.
	schema
		validate;
		subscriptionType
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateInterfaceTypeExtension_amp_A17 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface OtherInterface{
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface RelevantData{
							name: String
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm implements NamedEntity{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm{
							filmName: String
						}
						extend type GQLTestFilm implements NamedEntity{
							id: String
						}'.
	schema
		validate;
		addScalarsInSchema
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateInterfaceTypeExtension_amp_A22 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface OtherInterface{
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: Query
						}
						type GQLFilm implements RelevantData { 
							name: String
						}
						interface RelevantData{
							name : String
						}
						extend interface RelevantData{
							name: String
							id: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm implements NamedEntity{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						extend interface NamedEntity{
							id: String
						}
						type GQLTestFilm{
							filmName: String
						}
						extend type GQLTestFilm implements NamedEntity{
							id: String
						}'.
	schema
		validate;
		queryType
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypeExtension_amp_A19 [
	"I test correctness of: 

- `^ res` in method: `GQLSSchemaNode >> #addTypeExtensions:with:` when {#res->nil}

"

	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestQueryType{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						input GQLTestQueryTypeInput{ 
            					description : String
         				}
						extend type GQLTestQueryTypeInput{
							gender: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestFilm{
							id: String
							filmName: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
							name: String
						}
						extend type GQLTestFilm implements NamedEntity{
							filmName: String
						}'.
	valid := schema validate.
	self assert: schema schemaTypes size equals: 10.
	schema schemaExtensions: #().
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
						}
						extend type GQLTestFilm {
							filmName: String
						}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypeExtension_amp_A26 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestQueryType{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						input GQLTestQueryTypeInput{ 
            					description : String
         				}
						extend type GQLTestQueryTypeInput{
							gender: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestFilm{
							id: String
							filmName: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
							name: String
						}
						extend type GQLTestFilm implements NamedEntity{
							filmName: String
						}'.
	schema
		validate;
		typeExtensions.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
						}
						extend type GQLTestFilm {
							filmName: String
						}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypeExtension_amp_A27 [
	"I test correctness of: 

- `^ dictFieldsWithResolvers` in method: `GQLSSchemaNode >> #dictFieldsResolvers`

"

	<madeBySmallAmp>
	| valid aCollection |
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestQueryType{
							name: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						input GQLTestQueryTypeInput{ 
            					description : String
         				}
						extend type GQLTestQueryTypeInput{
							gender: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestFilm{
							id: String
							filmName: String
						}'.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
							name: String
						}
						extend type GQLTestFilm implements NamedEntity{
							filmName: String
						}'.
	aCollection := schema
		validate;
		dictFieldsResolvers.
	self assert: aCollection class equals: Dictionary.
	self assert: aCollection size equals: 0.
	self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
						}
						extend type GQLTestFilm {
							filmName: String
						}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypeExtension_amp_L23 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestQueryType{
							name: String
						}';
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						input GQLTestQueryTypeInput{ 
            					description : String
         				}
						extend type GQLTestQueryTypeInput{
							gender: String
						}';
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestFilm{
							id: String
							filmName: String
						}'.
	valid := (self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
							name: String
						}
						extend type GQLTestFilm implements NamedEntity{
							filmName: String
						}') validate
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypeExtension_amp_L7 [
	<madeBySmallAmp>
	| valid |
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestQueryType{
							name: String
						}';
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						input GQLTestQueryTypeInput{ 
            					description : String
         				}
	%					extend type GQLTestQueryTypeInput{
							gender: String
						}';
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						type GQLTestFilm{
							id: String
						}
						extend type GQLTestFilm{
							id: String
							filmName: String
						}'.
	valid := (self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
							name: String
						}
						extend type GQLTestFilm implements NamedEntity{
							filmName: String
						}') validate.
	schema := self
		parseSchema:
			'
						schema { 
							query: GQLTestFilm
						}
						interface NamedEntity{
							name: String
						}
						type GQLTestFilm implements NamedEntity{
							id: String
						}
						extend type GQLTestFilm {
							filmName: String
						}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFailValidateObjectTypesInterfaceWithArguments_amp [
	<madeBySmallAmp>
	schema := self
		parseSchema:
			'
						interface GQLTest{
							name(arg1 : Int, arg2 : String) : String
						}
						type GQLTestFilm implements GQLTest{ 
            					id : String
            					name(arg1 : Int) : String
         					}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFullNameWithParameters_amp_A28 [
	<madeBySmallAmp>
	| objectType field |
	schema := self
		parseSchema:
			'type GQLIBType{ 
            					some (name : String, parameters : String) : String
         					}'.
	schema
		getType: 'GQLIBType';
		validate
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testFullName_amp_L7 [
	<madeBySmallAmp>
	| objectType field |
	objectType := (self
		parseSchema:
			'type GQLTestFilm{ 
            id : String
            name : String
         }') getType: 'GQILTestFilm'.
	self
		should: [ self assert: objectType name: 'GQLTestFilm' ]
		raise: MessageNotUnderstood
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testNodesPosition_amp_A0 [
	<madeBySmallAmp>
	| type field |
	schema := self
		parseSchema:
			'type GQLTestFilm{ 
            					id : String
            					name : String
         					}'.
	schema
		getType: 'GQLTestFilm';
		validateSchemaDefinition
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateEnumTypeExtension_amp_L3 [
	<madeBySmallAmp>
	schema := self
		parseSchema:
			'
	schema { 
	query: GQLTestQueryType
	}
	enum MovieType{COMEDY, SCIENCE_FICTION}
	type GQLTestQueryType{
		classification(gender: MovieType): String
	}
	extend enum MovieType { DRAMA }
	'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateObjectTypesInterface_amp_L3 [
	<madeBySmallAmp>
	schema := self
		parseSchema:
			'
						interface GQLTest{
							name : String
						}
						type GQLTestFilm implements GQLTest{ 
            					id : String
           					name : String
         					}'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateSchemaIntrospection_amp_A22 [
	<madeBySmallAmp>
	| schemaNode type |
	schema := self
		parseSchema:
			'
					schema { 
						query: GQLTestFilm
					}
					type GQLTestFilm{ 
            				id : String
            				name : String
							film : GQLFilm
         			}
					type GQLFilm { 
							id : String 
					}	
					'.
	schemaNode := schema validate.
	schema queryType.
	self assert: schemaNode class: GQLSSchemaNode.
	type := schemaNode
		getType: '__Schema';
		getType: '__Type';
		getType: '__Field';
		getType: '__InputValue';
		getType: '__EnumValue';
		getType: '__Directive'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateSchemaIntrospection_amp_A88 [
	<madeBySmallAmp>
	| schemaNode type |
	schemaNode := (self
		parseSchema:
			'
					schema { 
						query: GQLTestFilm
					}
					type GQLTestFilm{ 
            				id : String
            				name : String
							film : GQLFilm
         			}
					type GQLFilm { 
							id : String 
					}	
					') validate.
	self assert: schemaNode class: GQLSSchemaNode.
	type := schemaNode
		getType: '__Schema';
		getType: '__Type';
		getType: '__Field';
		subscriptionType;
		getType: '__InputValue';
		getType: '__EnumValue';
		getType: '__Directive'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateSchemaIntrospection_amp_L21 [
	"I test correctness of: 

- `val isArray
	ifTrue: [ val
			detect: [ :aName | aName = aString ]
			ifFound: [ ^ 'GQLSTypeNode' ] ]` in method: `GQLSSchemaNode class >> #typeOfName:` when {#val->#('GQLSTypeNode' 'GQLSEnumTypeNode' 'GQLSInterfaceTypeNode' 'GQLSInputObjectTypeNode' 'GQLSInputObjectFieldNode' 'GQLSObjectTypeNode' 'GQLSStringTypeNode' 'GQLSUnionTypeNode' 'GQLSIntTypeNode' 'GQLSNonNullTypeNode' 'GQLSIDTypeNode' 'GQLSListTypeNode' 'GQLSBooleanTypeNode' 'GQLSFloatTypeNode')}

"

	<madeBySmallAmp>
	| schemaNode type |
	schemaNode := (self
		parseSchema:
			'
					schema { 
						query: GQLTestFilm
					}
					type GQLTestFilm{ 
            				id : String
            				name : String
							film : GQLFilm
         			}
					type GQLFilm { 
							id : String 
					}	
					') validate.
	self assert: schemaNode class: GQLSSchemaNode.
	type := schemaNode getType: '__Schema'.
	type := schemaNode getType: '__Type'.
	type := schemaNode getType: '__Field'.
	type := schemaNode getType: '__IvputValue'.
	self assert: type isNil.
	type := schemaNode
		getType: '__EnumValue';
		getType: '__Directive'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateSchemaIntrospection_amp_L26 [
	"I test correctness of: 

- `^ nil` in method: `GQLSSchemaNode class >> #typeOfName:`

"

	<madeBySmallAmp>
	| schemaNode type |
	schemaNode := (self
		parseSchema:
			'
					schema { 
						query: GQLTestFilm
					}
					type GQLTestFilm{ 
            				id : String
            				name : String
							film : GQLFilm
         			}
					type GQLFilm { 
							id : String 
					}	
					') validate.
	self assert: schemaNode class: GQLSSchemaNode.
	type := schemaNode getType: '__Schema'.
	type := schemaNode getType: '__Type'.
	type := schemaNode getType: '__Field'.
	type := schemaNode getType: '__InputValue'.
	type := schemaNode getType: '__EnjmValue'.
	self assert: type isNil.
	type := schemaNode getType: '__Directive'
]

{ #category : #'as yet unclassified' }
GQLSSchemaNodeTest243 >> testValidateSimpleClassWithNamedType_amp [
	"I test correctness of: 

- `^ defaultDirectives values` in method: `GQLSSchemaNode >> #directives`

"

	<madeBySmallAmp>
	schema := self
		parseSchema:
			'type A {
					id: InternalCount
					isB: BooleanType
					size: Int
					idA: ID_A
					values: [ Int ! ]
					params (name: StringName, prom: FloatingPoint, key: String): [Int]
				}'.
	self assert: schema directives class equals: Array.
	self assert: schema class equals: GQLSSchemaNode.
	self assert: schema directives class equals: Array.
	self assert: schema directives size equals: 2.
	self
		assert: (schema directives at: 1) class
		equals: GQLSDirectiveNode.
	self assert: (schema directives at: 1) name equals: 'include'.
	self
		assert: (schema directives at: 2) class
		equals: GQLSDirectiveNode.
	self assert: (schema directives at: 2) name equals: 'skip'.
	SmallAmp assertionsFor: schema.
]
