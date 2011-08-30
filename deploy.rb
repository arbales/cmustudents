#!/usr/bin/env ruby
require 'net-purge'
# Awful deployment script. blam.
`ssh 417east.com -p 9877 'cd cmustudents.org && git reset --hard && git clean -f && bundle && stasis'`
                
['cmustudents.org', 'www.cmustudents.org'].each do |name|
  Net::HTTP.start(name) do |http|
    request = Net::HTTP::Purge.new('/')
    response = http.request(request)
    if response.class == Net::HTTPOK
      puts "#{name}: Guru Meditiation"
    end
  end
end