#!/usr/bin/env ruby
require 'open-uri'
require 'json'

SCHEDULER.every '30m', :first_in => 0 do |job|
  url = URI.parse('http://aare.schwumm.ch/aare.json')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  temperature = parsed["temperature"]
  send_event('aare', { temperature: temperature })
end
