$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'filejoin'
require 'filemaker'

module Helpers
  def fake_stdin(text)
    begin
      $stdin = StringIO.new
      $stdin.puts(text)
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end
