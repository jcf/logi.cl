require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slugs/index.html.erb" do
  include SlugsHelper
  
  before(:each) do
    assigns[:slugs] = [
      stub_model(Slug,
        :text => "value for text",
        :link_id => 1
      ),
      stub_model(Slug,
        :text => "value for text",
        :link_id => 1
      )
    ]
  end

  it "should render list of slugs" do
    render "/slugs/index.html.erb"
    response.should have_tag("tr>td", "value for text".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

