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
  
  getShow: (show, callback) ->
    # Returns the formatted URL for a given show. The browser will request each of these asynchronously from Hulu.

    url = @url_base

    sort = "original_premiere_date"   # Sort by date
    order = "DESC"
    limit = 5

    # Add Show
    url += "&show_id[]=#{show}"

    # Add sorting and ordering
    url += "&sort=#{sort}&order=#{order}&items_per_page=#{limit}"

    callback url
