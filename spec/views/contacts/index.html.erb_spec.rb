require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/index.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contacts] = [
      stub_model(Contact,
        :name => "value for name",
        :email => "value for email",
        :website => "value for website",
        :message => "value for message",
        :remote_address => "value for remote_address"
      ),
      stub_model(Contact,
        :name => "value for name",
        :email => "value for email",
        :website => "value for website",
        :message => "value for message",
        :remote_address => "value for remote_address"
      )
    ]
  end

  it "should render list of contacts" do
    render "/contacts/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", "value for message".to_s, 2)
    response.should have_tag("tr>td", "value for remote_address".to_s, 2)
  end
end

