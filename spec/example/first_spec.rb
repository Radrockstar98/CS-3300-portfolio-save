require "rails_helper"
# test to see if the rspec is working by testing if 6 * 7 is equal to 43, this is false and should raise an error
RSpec.describe "The math below is wrong..." do
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(43)
  end
end

require "rails_helper"
# test to see if the rspec is working by testing if 6 * 7 is equal to 42, this is true and should pass
RSpec.describe "The math below is right..." do
  it "should equal 42" do
    expect(6 * 7).to eq(42)
  end
end

require "rails_helper"
# test to see if the rspec is working by testing a string  is equal to an empty string, here it should pass
RSpec.describe "hello spec" do
  # ...
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end