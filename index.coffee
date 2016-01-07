stream = require 'stream'

class Null extends stream.PassThrough
	_read: (size) ->
		@push null
		
	_write: (chunk, encoding, cb) ->
		cb()
		
	# keep writable open without ending it
	end: (chunk, encoding, cb) ->
		if cb
			cb()

stream.Null = new Null() 