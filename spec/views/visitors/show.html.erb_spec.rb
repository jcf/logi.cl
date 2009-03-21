require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/visitors/show.html.erb" do
  include VisitorsHelper
  before(:each) do
    assigns[:visitor] = @visitor = stub_model(Visitor,
      :user_agent => "value for user_agent",
      :clicks => 1,
      :remote_addr => "value for remote_addr"
    )
  end

  it "should render attributes in <p>" do
    render "/visitors/show.html.erb"
    response.should have_text(/value\ for\ user_agent/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ remote_addr/)
  end
end

