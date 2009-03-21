require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/index.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:messages] = [
      stub_model(Message),
      stub_model(Message)
    ]
  end

  it "should render list of messages" do
    render "/messages/index.html.erb"
  end
end

