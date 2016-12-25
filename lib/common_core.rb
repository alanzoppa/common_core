require "common_core/version"
require 'student'
require 'presenter'
require 'score_reader'

module CommonCore
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Student = ::Student
  Presenter = ::Presenter
  ScoreReader = ::ScoreReader
end
