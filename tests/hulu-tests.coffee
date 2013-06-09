crypto = require 'crypto'

# Generate hulu url

# From bluecop's XBMC Hulu plugin
url = ""  # Final Hulu URL
videoId = 489300
timestamp = String Math.round new Date().getTime() / 1000

params = {
     video_id: videoId,
     v: 888324234,
     ts: timestamp,
     np: 1,
     vp: 1,
     pp: 'Desktop',
     dp_id: 'Hulu',
     region: 'US',
     language: 'en',
   }

bcs1 = ""
url += "https://s.hulu.com/select?"
first = 1

# Iterate through parameters for md5 hash and url construction
for key, value of params
  console.log "#{key}: #{value}"
  bcs1 += key + value
  if first is 1
    # Deal with the age-old url & debacle
    url += "#{key}=#{value}"
    first = 0
  else
    url += "&#{key}=#{value}"
  

console.log "bcs1: #{bcs1}"
console.log "url: #{url}"

hmac = crypto.createHmac 'md5', "f6daaa397d51f568dd068709b0ce8e93293e078f7dfc3b40dd8c32d36d2b3ce1"
hmac.update bcs1
bcs = hmac.digest 'hex'

url += "&bcs=#{bcs}"

console.log url
