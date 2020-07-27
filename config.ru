require 'bundler'
require 'csv'

Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'controller'
require 'gossip'
run ApplicationController
