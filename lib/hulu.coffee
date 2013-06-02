### Handle integration with Hulu API ###

exports.Hulu = class Hulu
  constructor: (cfg) ->
    @cfg = cfg
  
  getShow: (showId) ->
    console.log showId