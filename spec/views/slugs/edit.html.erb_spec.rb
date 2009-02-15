require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slugs/edit.html.erb" do
  include SlugsHelper
  
  before(:each) do
    assigns[:slug] = @slug = stub_model(Slug,
      :new_record? => false,
      :text => "value for text",
      :link_id => 1
    )
  end

  it "should render edit form" do
    render "/slugs/edit.html.erb"
    
    response.should have_tag("form[action=#{slug_path(@slug)}][method=post]") do
      with_tag('input#slug_text[name=?]', "slug[text]")
      with_tag('input#slug_link_id[name=?]', "slug[link_id]")
    end
  end
end


