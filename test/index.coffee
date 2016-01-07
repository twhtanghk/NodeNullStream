stream = require 'stream'
Promise = require 'promise'
require '../index.js'
fs = require 'fs'
assert = require 'assert'
meter = require 'stream-meter'

describe 'Null stream', ->
	@timeout 40000
	
	it 'empty input', (done) ->
		count = meter 1024000
		dest = fs.createWriteStream '/dev/null'
		stream.Null
			.pipe count
			.pipe dest
			.on 'unpipe', ->
				assert count.bytes == 0
				done()
			
	read = (file) ->
		writeCount = meter 1024000
		
		fs.createReadStream file
			.pipe writeCount
			.pipe stream.Null
			
		new Promise (fulfill, reject) -> 
			writeCount.on 'finish', ->
				if writeCount.bytes != 0
					fulfill()
				else
					reject new Error 'writeCount == 0'
						
	it 'empty output', (done) ->
		read('test/index.coffee')
			.then ->
				done()
			.catch (err) ->
				done(err)
				
	it 'multiple write to stream.Null', (done) ->
		Promise.all [read('test/index.coffee'), read('test/index.coffee')]
			.then ->
				done()
			.catch (err) ->
				done(err)