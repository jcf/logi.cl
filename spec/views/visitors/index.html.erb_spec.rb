require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visitors/index.html.erb" do
  include VisitorsHelper
  
  before(:each) do
    assigns[:visitors] = [
      stub_model(Visitor,
        :user_agent => "value for user_agent",
        :clicks => 1,
        :remote_addr => "value for remote_addr"
      ),
      stub_model(Visitor,
        :user_agent => "value for user_agent",
        :clicks => 1,
        :remote_addr => "value for remote_addr"
      )
    ]
  end

  it "should render list of visitors" do
    render "/visitors/index.html.erb"
    response.should have_tag("tr>td", "value for user_agent".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for remote_addr".to_s, 2)
  end
end

