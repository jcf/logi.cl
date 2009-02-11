require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/show.html.erb" do
  include ContactsHelper
  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :name => "value for name",
      :email => "value for email",
      :website => "value for website",
      :message => "value for message",
      :remote_address => "value for remote_address"
    )
  end

  it "should render attributes in <p>" do
    render "/contacts/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/value\ for\ message/)
    response.should have_text(/value\ for\ remote_address/)
  end
end

