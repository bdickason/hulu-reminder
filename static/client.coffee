$ ->

  getShow = (show, callback) ->
    # Returns the formatted URL for a given show. The browser will request each of these asynchronously from Hulu.

    url = "http://www.hulu.com/api/2.0/videos.json?video_type[]=episodes"
        
    sort = "original_premiere_date"   # Sort by date
    order = "DESC"
    limit = 5
    
    # Add Show
    url += "&show_id[]=#{show}"

    # Add sorting and ordering
    url += "&sort=#{sort}&order=#{order}&items_per_page=#{limit}"
    
    callback url
  console.log shows
  for id, name of shows
    console.log id
    console.log name
    getShow id, (callback) ->
      $.ajax({
        url: callback
        })
        .done ->
          console.log 'done'
      console.log callback