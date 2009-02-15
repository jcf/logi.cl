require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slugs/new.html.erb" do
  include SlugsHelper
  
  before(:each) do
    assigns[:slug] = stub_model(Slug,
      :new_record? => true,
      :text => "value for text",
      :link_id => 1
    )
  end

  it "should render new form" do
    render "/slugs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", slugs_path) do
      with_tag("input#slug_text[name=?]", "slug[text]")
      with_tag("input#slug_link_id[name=?]", "slug[link_id]")
    end
  end
end


