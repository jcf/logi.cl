require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visitors/edit.html.erb" do
  include VisitorsHelper
  
  before(:each) do
    assigns[:visitor] = @visitor = stub_model(Visitor,
      :new_record? => false,
      :user_agent => "value for user_agent",
      :clicks => 1,
      :remote_addr => "value for remote_addr"
    )
  end

  it "should render edit form" do
    render "/visitors/edit.html.erb"
    
    response.should have_tag("form[action=#{visitor_path(@visitor)}][method=post]") do
      with_tag('textarea#visitor_user_agent[name=?]', "visitor[user_agent]")
      with_tag('input#visitor_clicks[name=?]', "visitor[clicks]")
      with_tag('input#visitor_remote_addr[name=?]', "visitor[remote_addr]")
    end
  end
end


