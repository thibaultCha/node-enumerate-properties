should     = require 'should'
properties = require '../lib/enumerate-properties'

#search = require 'recursive-search'

describe 'enumerate-properties.js', ->

	testObject =
		foo: 'bar'
		bar: 'foo'
		nested: 
			foo: 'bar'
			bar: 'foo'
		foobar: 'barfoo'
		verynested:
			nested:
				foo: 'bar'
				bar: 'foo'

	describe 'enumerate()', ->
		it 'should enumerate all properties of an propertiesect', ->
			props = []
			properties.enumerate testObject, (prop) ->
				props.push prop

			props[0].should.equal 'foo'
			props[1].should.equal 'bar'
			props[2].should.equal 'nested.foo'
			props[3].should.equal 'nested.bar'
			props[4].should.equal 'foobar'
			props[6].should.equal 'verynested.nested.bar'

	describe 'getAtPath()', ->
		it 'should get a property at given path', ->
			result = properties.getAtPath testObject, 'nested.foo'
			result.should.equal 'bar'

			result = properties.getAtPath testObject, 'foo'
			result.should.equal 'bar'

			result = properties.getAtPath testObject, 'foobar'
			result.should.equal 'barfoo'

			result = properties.getAtPath testObject, 'verynested.nested.bar'
			result.should.equal 'foo'

		it 'should return null if no propertiesect is passed', ->
			result = properties.getAtPath null, ''
			(result is null).should.be.true

		it 'should return null if invalid path is provided', ->
			result = properties.getAtPath testObject, 'inexistant'
			(result is null).should.be.true

			result = properties.getAtPath testObject, 'inexistant,invalid'
			(result is null).should.be.true

			result = properties.getAtPath testObject, null
			(result is null).should.be.true

	describe 'setAtPath()', ->
		it 'should set a property at given path', ->
			properties.setAtPath testObject, 'nested.foo', 'newvalue'
			testObject.nested.foo.should.equal 'newvalue'

		it 'should create the property art given path if it doesn\'t already exists', ->
			properties.setAtPath testObject, 'newpath.newprop', 'newval'
			testObject.newpath.newprop.should.equal 'newval'
