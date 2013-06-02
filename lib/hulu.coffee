request = require 'request'

### Handle integration with Hulu API ###

exports.Hulu = class Hulu
  constructor: (cfg) ->
    @cfg = cfg
    @url_base = "http://www.hulu.com/api/2.0/videos.json?video_type[]=episodes"
  
  getShows: (callback) ->
    # Returns a list of shows
    shows = {
      "New Girl": 7529
    }

    url = @url_base
        
    sort = "original_premiere_date"   # Sort by date
    order = "DESC"
    
    # Add Shows
    for name, id of shows
      url += "&show_id[]=#{id}"

    # Add sorting and ordering
    url += "&sort=#{sort}&order=#{order}"
    
    request url, (err, response, body) ->
      if !err and response.statusCode is 200
        callback JSON.parse response.body # Convert string to JSON and return it
      else
        callback err
    
    