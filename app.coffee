express = require 'express'
cfg = require './cfg/config.js'
Hulu = (require './lib/hulu.js').Hulu

app = express()
app.use express.bodyParser()
app.use express.cookieParser()
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.static __dirname + '/static'  

### Controllers ###
hulu = new Hulu cfg

### Routes ###      
app.get '/', (req, res) ->
  console.log 'Hulu!'
        
### Start the App ###
app.listen "#{cfg.PORT}"
