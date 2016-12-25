require "common_core/version"
require 'student'
require 'presentation'

module CommonCore
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Student = ::Student
  Presentation = ::Presentation
end
