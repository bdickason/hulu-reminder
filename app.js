// Generated by CoffeeScript 1.4.0
(function() {
  var Hulu, Xbmc, app, cfg, express, hulu, xbmc;

  express = require('express');

  cfg = require('./cfg/config.js');

  Hulu = (require('./lib/hulu.js')).Hulu;

  Xbmc = (require('./lib/xbmc.js')).Xbmc;

  app = express();

  app.use(express.bodyParser());

  app.use(express.cookieParser());

  app.set('views', __dirname + '/views');

  app.set('view engine', 'jade');

  app.use(express["static"](__dirname + '/static'));

  /* Controllers
  */


  hulu = new Hulu(cfg);

  xbmc = new Xbmc(cfg);

  /* Routes
  */


  app.get('/', function(req, res) {
    return res.send('Hulu!');
  });

  app.get('/shows', function(req, res) {
    var shows;
    shows = {
      7529: "New Girl",
      1968: "Parks & Recreation"
    };
    return res.render('shows/index', {
      shows: shows
    });
  });

  app.get('/addons', function(req, res) {
    return xbmc.getAddons(function(callback) {
      return res.send(callback);
    });
  });

  /* Start the App
  */


  app.listen("" + cfg.PORT);

}).call(this);
