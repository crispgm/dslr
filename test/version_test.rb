require "helper"

class VersionTest < DslrTest
  context "version" do
    should "have version" do
      refute_nil Dslr::VERSION
    end
  end
end
