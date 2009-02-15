require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VisitorsController do

  def mock_visitor(stubs={})
    @mock_visitor ||= mock_model(Visitor, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all visitors as @visitors" do
      Visitor.should_receive(:find).with(:all).and_return([mock_visitor])
      get :index
      assigns[:visitors].should == [mock_visitor]
    end

    describe "with mime type of xml" do
  
      it "should render all visitors as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Visitor.should_receive(:find).with(:all).and_return(visitors = mock("Array of Visitors"))
        visitors.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested visitor as @visitor" do
      Visitor.should_receive(:find).with("37").and_return(mock_visitor)
      get :show, :id => "37"
      assigns[:visitor].should equal(mock_visitor)
    end
    
    describe "with mime type of xml" do

      it "should render the requested visitor as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Visitor.should_receive(:find).with("37").and_return(mock_visitor)
        mock_visitor.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new visitor as @visitor" do
      Visitor.should_receive(:new).and_return(mock_visitor)
      get :new
      assigns[:visitor].should equal(mock_visitor)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested visitor as @visitor" do
      Visitor.should_receive(:find).with("37").and_return(mock_visitor)
      get :edit, :id => "37"
      assigns[:visitor].should equal(mock_visitor)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created visitor as @visitor" do
        Visitor.should_receive(:new).with({'these' => 'params'}).and_return(mock_visitor(:save => true))
        post :create, :visitor => {:these => 'params'}
        assigns(:visitor).should equal(mock_visitor)
      end

      it "should redirect to the created visitor" do
        Visitor.stub!(:new).and_return(mock_visitor(:save => true))
        post :create, :visitor => {}
        response.should redirect_to(visitor_url(mock_visitor))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved visitor as @visitor" do
        Visitor.stub!(:new).with({'these' => 'params'}).and_return(mock_visitor(:save => false))
        post :create, :visitor => {:these => 'params'}
        assigns(:visitor).should equal(mock_visitor)
      end

      it "should re-render the 'new' template" do
        Visitor.stub!(:new).and_return(mock_visitor(:save => false))
        post :create, :visitor => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested visitor" do
        Visitor.should_receive(:find).with("37").and_return(mock_visitor)
        mock_visitor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :visitor => {:these => 'params'}
      end

      it "should expose the requested visitor as @visitor" do
        Visitor.stub!(:find).and_return(mock_visitor(:update_attributes => true))
        put :update, :id => "1"
        assigns(:visitor).should equal(mock_visitor)
      end

      it "should redirect to the visitor" do
        Visitor.stub!(:find).and_return(mock_visitor(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(visitor_url(mock_visitor))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested visitor" do
        Visitor.should_receive(:find).with("37").and_return(mock_visitor)
        mock_visitor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :visitor => {:these => 'params'}
      end

      it "should expose the visitor as @visitor" do
        Visitor.stub!(:find).and_return(mock_visitor(:update_attributes => false))
        put :update, :id => "1"
        assigns(:visitor).should equal(mock_visitor)
      end

      it "should re-render the 'edit' template" do
        Visitor.stub!(:find).and_return(mock_visitor(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested visitor" do
      Visitor.should_receive(:find).with("37").and_return(mock_visitor)
      mock_visitor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the visitors list" do
      Visitor.stub!(:find).and_return(mock_visitor(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(visitors_url)
    end

  end

end
