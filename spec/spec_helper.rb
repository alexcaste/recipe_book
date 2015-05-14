ENV['RACK_ENV'] = 'test'


require("bundler/setup")
Bundler.require(:default, :test, :production)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
