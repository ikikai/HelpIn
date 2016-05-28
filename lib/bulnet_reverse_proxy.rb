require 'rack'
require 'rack/reverse_proxy'

class HelloWorld
  def response
    [200, {}, ['Hello World']]  
  end
end

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

app = Rack::Builder.new do 
  use Rack::ReverseProxy do
    reverse_proxy /^\/bulnet_proxy(\/.*)$/, 'http://dcl.bas.bg/bulnet$1'
  end
  run HelloWorldApp
end

Rack::Server.start :app => app
