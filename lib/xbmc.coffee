{TCPConnection, xbmc} = require 'xbmc'

### Handle integration with XBMC on Apple TV ###


exports.Xbmc = class Xbmc
  constructor: (cfg) ->
    @cfg = cfg
    @connection = new TCPConnection
      host: '192.168.1.112'
      port: 8080,
      verbose: true
    @xbmc = new xbmc
    @xbmc.setConnection @connection
    @xbmc.on 'connection:open', ->
      console.log 'Connection!'
      @xbmc.message 'test!'

  getAddons: (result) ->
    
    ### request 'Addons.GetAddons', [], (err, error, response) ->
      console.log 'got here'
      if err
        console.log err
      else
        console.log response
        callback response ###