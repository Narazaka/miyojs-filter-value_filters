chai = require 'chai'
chai.should()
expect = chai.expect
sinon = require 'sinon'
MiyoFilters = require '../value_filters.js'

describe 'set_value_filters', ->
	ms = null
	request = null
	id = null
	stash = null
	argument = null
	beforeEach ->
		ms = sinon.stub()
		ms.value_filters = []
		request = sinon.stub()
		id = 'OnTest'
		stash = null
		argument = dummy: 'dummy'
	it 'should return original argument', ->
		argument.set_value_filters = ['filter1']
		return_argument = MiyoFilters.set_value_filters.call ms, argument, request, id, stash
		return_argument.should.be.deep.equal argument
	it 'should work', ->
		ms.value_filters.push 'pre'
		argument.set_value_filters = ['filter1']
		MiyoFilters.set_value_filters.call ms, argument, request, id, stash
		ms.value_filters.should.be.deep.equal argument.set_value_filters

describe 'append_value_filters', ->
	ms = null
	request = null
	id = null
	stash = null
	argument = null
	beforeEach ->
		ms = sinon.stub()
		ms.value_filters = []
		request = sinon.stub()
		id = 'OnTest'
		stash = null
		argument = dummy: 'dummy'
	it 'should return original argument', ->
		argument.append_value_filters = ['filter1']
		return_argument = MiyoFilters.append_value_filters.call ms, argument, request, id, stash
		return_argument.should.be.deep.equal argument
	it 'should work', ->
		ms.value_filters.push 'pre'
		argument.append_value_filters = ['filter1', 'filter2']
		MiyoFilters.append_value_filters.call ms, argument, request, id, stash
		ms.value_filters.should.be.deep.equal ['pre', 'filter1', 'filter2']

describe 'prepend_value_filters', ->
	ms = null
	request = null
	id = null
	stash = null
	argument = null
	beforeEach ->
		ms = sinon.stub()
		ms.value_filters = []
		request = sinon.stub()
		id = 'OnTest'
		stash = null
		argument = dummy: 'dummy'
	it 'should return original argument', ->
		argument.prepend_value_filters = ['filter1']
		return_argument = MiyoFilters.prepend_value_filters.call ms, argument, request, id, stash
		return_argument.should.be.deep.equal argument
	it 'should work', ->
		ms.value_filters.push 'pre'
		argument.prepend_value_filters = ['filter1', 'filter2']
		MiyoFilters.prepend_value_filters.call ms, argument, request, id, stash
		ms.value_filters.should.be.deep.equal ['filter2', 'filter1', 'pre']

describe 'remove_value_filters', ->
	ms = null
	request = null
	id = null
	stash = null
	argument = null
	beforeEach ->
		ms = sinon.stub()
		ms.value_filters = []
		request = sinon.stub()
		id = 'OnTest'
		stash = null
		argument = dummy: 'dummy'
	it 'should return original argument', ->
		argument.remove_value_filters = ['filter1']
		return_argument = MiyoFilters.remove_value_filters.call ms, argument, request, id, stash
		return_argument.should.be.deep.equal argument
	it 'should work', ->
		ms.value_filters.push 'pre1', 'pre2', 'pre3', 'pre4', 'pre5', 'pre6'
		argument.remove_value_filters = ['pre5', 'pre2']
		MiyoFilters.remove_value_filters.call ms, argument, request, id, stash
		ms.value_filters.should.be.deep.equal ['pre1', 'pre3', 'pre4', 'pre6']
