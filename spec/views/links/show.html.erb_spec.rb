require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/show.html.erb" do
  include LinksHelper
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :url => "value for url"
    )
  end

  it "should render attributes in <p>" do
    render "/links/show.html.erb"
    response.should have_text(/value\ for\ url/)
  end
end

