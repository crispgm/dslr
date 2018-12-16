require "helper"

class MathTest < DslrTest
  context "math" do
    should "add and sub" do
      p = Dslr::Parser.new("./test/fixtures/dummy.dslr")
      p.add(1)
      assert_equal 1, p.result
      p.add(2, 3)
      assert_equal 6, p.result
      p.sub(1)
      assert_equal 5, p.result
      p.sub(2, 3)
      assert_equal 0, p.result
    end

    should "mul and div" do
      p = Dslr::Parser.new("./test/fixtures/dummy.dslr")
      p.add(1)
      assert_equal 1, p.result
      p.mul(2, 3)
      assert_equal 6, p.result
      p.div(1)
      assert_equal 6, p.result
      p.div(2, 3)
      assert_equal 1, p.result
    end

    should "sqrt" do
      p = Dslr::Parser.new("./test/fixtures/dummy.dslr")
      p.add(4)
      p.sqrt
      assert_in_delta 2, p.result, 0.001
    end

    should "const" do
      p = Dslr::Parser.new("./test/fixtures/dummy.dslr")
      assert_equal Math::E, p.E
      assert_equal Math::PI, p.PI
    end
  end
end
