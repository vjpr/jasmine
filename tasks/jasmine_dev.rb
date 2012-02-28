require 'thor'
require 'json'
require 'term/ansicolor'

path_to = File.expand_path(File.dirname(__FILE__))

require "#{path_to}/jasmine_dev/base"
require "#{path_to}/jasmine_dev/js_hint"
require "#{path_to}/jasmine_dev/build"
require "#{path_to}/jasmine_dev/count_specs"
require "#{path_to}/jasmine_dev/execute_specs"
