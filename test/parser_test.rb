require "helper"

class ParserTest < DslrTest
  context "basic paring" do
    should "read file" do
      p = Dslr::Parser.new("./test/fixtures/simple.dslr")
      assert_equal "set :test, 1\nget :test\nprint :test\n", p.file_content
    end
  end
end
