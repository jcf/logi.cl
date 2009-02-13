require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/show.html.erb" do
  include MessagesHelper
  before(:each) do
    assigns[:message] = @message = stub_model(Message)
  end

  it "should render attributes in <p>" do
    render "/messages/show.html.erb"
  end
end

