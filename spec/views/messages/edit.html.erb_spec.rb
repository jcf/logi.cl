require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/messages/edit.html.erb"
    
    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
    end
  end
end


