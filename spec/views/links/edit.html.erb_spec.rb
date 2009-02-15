require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/links/edit.html.erb" do
  include LinksHelper
  
  before(:each) do
    assigns[:link] = @link = stub_model(Link,
      :new_record? => false,
      :url => "value for url"
    )
  end

  it "should render edit form" do
    render "/links/edit.html.erb"
    
    response.should have_tag("form[action=#{link_path(@link)}][method=post]") do
      with_tag('input#link_url[name=?]', "link[url]")
    end
  end
end


