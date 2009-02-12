require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include messagesHelper
  
  before(:each) do
    assigns[:message] = stub_model(message,
      :new_record? => true,
      :name => "value for name",
      :email => "value for email",
      :website => "value for website",
      :message => "value for message",
      :remote_address => "value for remote_address"
    )
  end

  it "should render new form" do
    render "/messages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("input#message_name[name=?]", "message[name]")
      with_tag("input#message_email[name=?]", "message[email]")
      with_tag("input#message_website[name=?]", "message[website]")
      with_tag("textarea#message_message[name=?]", "message[message]")
      with_tag("input#message_remote_address[name=?]", "message[remote_address]")
    end
  end
end


