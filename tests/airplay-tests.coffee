airplay = require 'airplay'

browser = airplay.createBrowser()

browser.on 'deviceOnline', (device) ->
  console.log "Device Online: [#{device.id}]"
  console.log device.info_

browser.start()


