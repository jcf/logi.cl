require File.dirname(__FILE__) + '/../spec_helper'

context "Slug class with fixtures loaded" do
  fixtures :slugs

  specify "should count two Slugs" do
    Slug.count.should_be 2
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
