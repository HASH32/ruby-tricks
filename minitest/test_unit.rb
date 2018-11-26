require 'test/unit'

class StringTest < Test::Unit::TestCase
  def setup
    puts "inside setup function"
  end

  def test_empty
    empty_string = ""
    puts "inside test_empty"
    assert empty_string.empty?
  end

  def teardown
    puts "tearing down"
  end
end
