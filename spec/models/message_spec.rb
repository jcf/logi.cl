require File.dirname(__FILE__) + '/../spec_helper'

context "Message class with fixtures loaded" do
  fixtures :messages

  specify "should count two Messages" do
    Message.count.should_be 2
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
