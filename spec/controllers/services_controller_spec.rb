require File.dirname(__FILE__) + '/../spec_helper'

context "The ServicesController" do
  # fixtures :services
  controller_name :services

  specify "should be a ServicesController" do
    controller.should_be_an_instance_of ServicesController
  end


  specify "should accept GET to index"
    get 'index'
    response.should_be_success
  end

  specify "should have more specifications" do
    violated "not enough specs"
  end
end
