### Handle integration with Hulu API ###

exports.Hulu = class Hulu
  constructor: (cfg) ->
    @cfg = cfg
  
  getShows: (callback) ->
    # Returns a list of shows
    url_base = "http://www.hulu.com/api/2.0/videos.json?video_type[]=episodes"
    
    shows = {
      "Parks and Recreation": 1968,
      "New Girl": 7529
    }
    
    sort = "original_premiere_date"   # Sort by date
    order = "DESC"
    
    url = url_base
    
    # Add Shows
    console.log shows
    for name, id of shows
      url += "&show_id[]=#{id}"
      console.log url

    # Add sorting and ordering
    url += "&sort=#{sort}&order=#{order}"
    callback url

  
    