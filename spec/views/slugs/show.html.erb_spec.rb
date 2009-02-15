require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/slugs/show.html.erb" do
  include SlugsHelper
  before(:each) do
    assigns[:slug] = @slug = stub_model(Slug,
      :text => "value for text",
      :link_id => 1
    )
  end

  it "should render attributes in <p>" do
    render "/slugs/show.html.erb"
    response.should have_text(/value\ for\ text/)
    response.should have_text(/1/)
  end
end

