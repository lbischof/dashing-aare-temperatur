#!/usr/bin/env ruby
require 'open-uri'
require 'json'

SCHEDULER.every '1m', :first_in => 0 do |job|
  # code for API is at https://github.com/guggero/aare-server
  url = URI.parse('https://api.illubits.ch/aare/v1/current')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') {|http|
    http.request(req)
  }
  parsed  = JSON.parse(res.body)
  temperature = "0.0"
  parsed["stations"].each{|station|
    if "Aare - Bern".eql? station["name"]
      temperature = station["temperature"]
    end
  }
  send_event('aare', { temperature: temperature })
end

