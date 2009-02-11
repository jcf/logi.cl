require File.dirname(__FILE__) + '/../spec_helper'

context "Contact class with fixtures loaded" do
  fixtures :contacts

  specify "should count two Contacts" do
    Contact.count.should_be 2
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
