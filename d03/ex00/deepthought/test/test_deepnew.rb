require "minitest/autorun"
require "deepthought"

class Deepthoughtnew < Minitest::Test
  def setup
    @deepthought = Deepthought.new
  end
  def test_deepthought_type_object
    assert_equal Deepthought,@deepthought.class
  end
  def test_answer_true
    assert_equal "42", @deepthought.respond("The Ultimate Question of Life, the Universe and Everything")
  end
  def test_answer_false
    assert_equal "Mmmm i m bored", @deepthought.respond("maman, pourquoi la pluie ?")
  end
end