{TCPConnection, XbmcApi} = require 'xbmc'

### Handle integration with XBMC on Apple TV ###


exports.Xbmc = class Xbmc
  constructor: (cfg) ->
    @cfg = cfg
    @connection = new TCPConnection
      host: '192.168.1.112'
      port: 8080,
      verbose: true
    @xbmcApi = new XbmcApi
      silent: true,
      connection: @connection
    @xbmcApi.on 'connection:open', =>
      console.log 'Connection!'
      @xbmcApi.message 'test!'
    @xbmcApi.on 'connection:error', ->
      console.log 'error!'

  getAddons: (result) ->
    console.log 'blah'
    
    ### request 'Addons.GetAddons', [], (err, error, response) ->
      console.log 'got here'
      if err
        console.log err
      else
        console.log response
        callback response ###