require "common_core/version"
require 'student'
require 'presenter'
require 'score_reader'

module CommonCore
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  Student = ::Student
  Presenter = ::Presenter
  ScoreReader = ::ScoreReader

  # basically HashWithIndifferentAccess from Rails::ActiveSupport
  class IndifferentHash < Hash
    def initialize
      super
      self.default_proc = proc {|h, k| h.key?(k.to_s) ? h[k.to_s] : nil}
    end
  end
end
