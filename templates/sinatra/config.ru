require 'rubygems'
require 'bundler'

Bundler.require

require './demo'

use DemoBackend
run Golf::Rack.new

