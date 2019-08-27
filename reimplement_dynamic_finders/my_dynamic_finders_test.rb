require 'minitest/autorun'
require_relative 'user'

class MyDynamicFindersTest < MiniTest::Test
  def setup
    $DATABASE = []
    $DATABASE << User.new(1, 'Masafumi', 'Okura', 30, 1)
    $DATABASE << User.new(2, 'John', 'Doe', 45, 1)
    $DATABASE << User.new(3, 'Miku', 'Hatsune', 16, 0)
  end

  def test_find_by_first_name
    assert_equal 2, User.find_by_first_name('John').id
  end

  def test_find_by_last_name
    assert_equal 3, User.find_by_last_name('Hatsune').id
  end

  def test_find_by_age
    assert_equal 1, User.find_by_age(30).id
  end

  def test_find_by_age_and_sex
    assert_equal 3, User.find_by_age_and_sex(16, 0).id
  end

  def test_find_by_first_name_and_last_name_and_age_and_sex
    assert_equal 1, User.find_by_first_name_and_last_name_and_age_and_sex('Masafumi', 'Okura', 30, 1).id
  end

  def test_find_by_age!
    assert_equal 1, User.find_by_age!(30).id
  end

  def test_raise_exception_without_finding_any_record_by_find_by_first_name!
    assert_raises { User.find_by_first_name!('Best') }
  end
end
