# NodeNullStream
NodeJS Null Readable or Writable Stream

## Installation
```
npm install nodenullstream
```

## Use
```
stream = require 'stream'
require 'nodenullstream'

# readable stream
stream.Null
	.pipe dest
	
# writable stream
fs.createReadStream file
	.pipe stream.Null
		
```

## Test
```
npm test
```