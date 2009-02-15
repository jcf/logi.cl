require File.dirname(__FILE__) + '/../spec_helper'

context "Link class with fixtures loaded" do
  fixtures :links

  specify "should count two Links" do
    Link.count.should_be 2
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
