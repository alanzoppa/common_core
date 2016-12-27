require "common_core/version"
require 'common_core/student'
require 'common_core/presenter'
require 'common_core/score_reader'
require 'insensitive_hash/minimal'

module CommonCore
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Student = ::Student
  Presenter = ::Presenter
  ScoreReader = ::ScoreReader
  InsensitiveHash = ::InsensitiveHash
end
