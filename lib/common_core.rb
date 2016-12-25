require "common_core/version"
require 'student'
require 'presenter'
require 'score_reader'
require 'insensitive_hash/minimal'


module CommonCore
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Student = ::Student
  Presenter = ::Presenter
  ScoreReader = ::ScoreReader
  InsensitiveHash = ::InsensitiveHash
end
