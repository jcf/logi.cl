require File.dirname(__FILE__) + '/../spec_helper'

context "Visitor class with fixtures loaded" do
  fixtures :visitors

  specify "should count two Visitors" do
    Visitor.count.should_be 2
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
