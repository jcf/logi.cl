require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/new.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:link] = stub_model(Link,
      :new_record? => true,
      :url => "value for url"
    )
  end

  it "should render new form" do
    render "/links/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", links_path) do
      with_tag("input#link_url[name=?]", "link[url]")
    end
  end
end


