require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlugsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "slugs", :action => "index").should == "/slugs"
    end
  
    it "should map #new" do
      route_for(:controller => "slugs", :action => "new").should == "/slugs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "slugs", :action => "show", :id => 1).should == "/slugs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "slugs", :action => "edit", :id => 1).should == "/slugs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "slugs", :action => "update", :id => 1).should == "/slugs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "slugs", :action => "destroy", :id => 1).should == "/slugs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/slugs").should == {:controller => "slugs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/slugs/new").should == {:controller => "slugs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/slugs").should == {:controller => "slugs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/slugs/1").should == {:controller => "slugs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/slugs/1/edit").should == {:controller => "slugs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/slugs/1").should == {:controller => "slugs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/slugs/1").should == {:controller => "slugs", :action => "destroy", :id => "1"}
    end
  end
end
