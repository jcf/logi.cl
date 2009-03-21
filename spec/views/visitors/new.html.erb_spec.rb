require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visitors/new.html.erb" do
  include VisitorsHelper
  
  before(:each) do
    assigns[:visitor] = stub_model(Visitor,
      :new_record? => true,
      :user_agent => "value for user_agent",
      :clicks => 1,
      :remote_addr => "value for remote_addr"
    )
  end

  it "should render new form" do
    render "/visitors/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", visitors_path) do
      with_tag("textarea#visitor_user_agent[name=?]", "visitor[user_agent]")
      with_tag("input#visitor_clicks[name=?]", "visitor[clicks]")
      with_tag("input#visitor_remote_addr[name=?]", "visitor[remote_addr]")
    end
  end
end


