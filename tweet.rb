!# /usr/bin/env ruby

require 'twitter'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

client = Twitter::REST::Client.new do |config|
  config.consumer_key = "lEtW9b7LrtvZLB3K05ybxQ"
  config.consumer_secret = "VwqMXOMIl3YEp2dCGtIEz9BI9u1GQe3bwf2xQg"
  config.access_token = "2183321322-Wy7CMuH4AkmU5aiMbedmuSpgtVwXDsDAZBFeB7t"
  config.access_token_secret = "xEnpDnISuXCVY1pB6BrfOLHvLWRcj6QgMmVcqfFfYXicV"
end

string = ARGV.join(" ")
client.update(string)
