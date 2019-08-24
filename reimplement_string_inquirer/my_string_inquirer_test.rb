require 'minitest/autorun'
require_relative 'my_string_inquirer'

class MyStringInquirerTest < MiniTest::Test
  def setup
    @string_inquirer = MyStringInquirer.new("production")
  end

  def test_match
    assert @string_inquirer.production?
  end

  def test_miss
    refute @string_inquirer.development?
  end

  def test_missing_question_mark
    assert_raises(NoMethodError) { @string_inquirer.production }
  end
end
