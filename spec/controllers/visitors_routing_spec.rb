require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VisitorsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "visitors", :action => "index").should == "/visitors"
    end
  
    it "should map #new" do
      route_for(:controller => "visitors", :action => "new").should == "/visitors/new"
    end
  
    it "should map #show" do
      route_for(:controller => "visitors", :action => "show", :id => 1).should == "/visitors/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "visitors", :action => "edit", :id => 1).should == "/visitors/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "visitors", :action => "update", :id => 1).should == "/visitors/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "visitors", :action => "destroy", :id => 1).should == "/visitors/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/visitors").should == {:controller => "visitors", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/visitors/new").should == {:controller => "visitors", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/visitors").should == {:controller => "visitors", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/visitors/1").should == {:controller => "visitors", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/visitors/1/edit").should == {:controller => "visitors", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/visitors/1").should == {:controller => "visitors", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/visitors/1").should == {:controller => "visitors", :action => "destroy", :id => "1"}
    end
  end
end
