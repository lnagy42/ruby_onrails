require 'minitest/autorun'
require 'deepthought'

class Deepthoughtnew < Minitest::Test
  def test_answer
    a = Deepthought.new
    a.respond("The Ultimate Question of Life, the Universe and Everything")
    assert_equals "42"
  end
  def test_answer2
    a = Deepthought.new
    a.respond("umi")
    assert_equals "Mmmm i m bored"
  end
end