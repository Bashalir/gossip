require 'bundler'
require 'csv'
require 'gossip'

Bundler.require

$:.unshift File.expand_path('lib', __dir__)
require 'controller'
run ApplicationController
