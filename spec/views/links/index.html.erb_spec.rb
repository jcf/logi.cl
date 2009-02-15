require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/index.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:links] = [
      stub_model(Link,
        :url => "value for url"
      ),
      stub_model(Link,
        :url => "value for url"
      )
    ]
  end

  it "should render list of links" do
    render "/links/index.html.erb"
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end

