require 'sinatra'
require 'pp'

get '/' do
  config = PP.pp(RbConfig::CONFIG, '')
  pp "<pre>#{config}</pre>"
end
