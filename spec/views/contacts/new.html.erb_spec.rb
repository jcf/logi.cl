require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/new.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contact] = stub_model(Contact,
      :new_record? => true,
      :name => "value for name",
      :email => "value for email",
      :website => "value for website",
      :message => "value for message",
      :remote_address => "value for remote_address"
    )
  end

  it "should render new form" do
    render "/contacts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", contacts_path) do
      with_tag("input#contact_name[name=?]", "contact[name]")
      with_tag("input#contact_email[name=?]", "contact[email]")
      with_tag("input#contact_website[name=?]", "contact[website]")
      with_tag("textarea#contact_message[name=?]", "contact[message]")
      with_tag("input#contact_remote_address[name=?]", "contact[remote_address]")
    end
  end
end


