express = require 'express'
cfg = require './cfg/config.js'
Hulu = (require './lib/hulu.js').Hulu
Xbmc = (require './lib/xbmc.js').Xbmc

app = express()
app.use express.bodyParser()
app.use express.cookieParser()
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.static __dirname + '/static'  

### Controllers ###
hulu = new Hulu cfg
xbmc = new Xbmc cfg

### Routes ###      
app.get '/', (req, res) ->
  res.send 'Hulu!'

app.get '/shows', (req, res) ->
  shows = {
    7529: "New Girl",
    1968: "Parks & Recreation"
  }
      
  res.render 'shows/index', { shows: shows }

app.get '/addons', (req, res) ->
  xbmc.getAddons (callback) ->
    res.send callback
  
### Start the App ###
app.listen "#{cfg.PORT}"
