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