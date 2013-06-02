request = require 'request'

### Handle integration with Hulu API ###
# Docs pulled from here: http://piratealt.blogspot.com/2012/08/improved-hulu-hulu-plus-search-results.html
# Thumbnail URL - http://ib3.huluim.com/video/60215690?size=220x124&amp;region=us
# Show URL - http://ib2.huluim.com/show_key_art/7529?size=1600x600&region=US
# Valid Image Sizes:
# 220x124
# 476x268
# 1600x600

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
    limit = 5
    
    # Add Shows
    for name, id of shows
      url += "&show_id[]=#{id}"

    # Add sorting and ordering
    url += "&sort=#{sort}&order=#{order}&items_per_page=#{limit}"
    
    request url, (err, response, body) ->
      if !err and response.statusCode is 200
        callback JSON.parse response.body # Convert string to JSON and return it
      else
        callback err
    

    