require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SlugsController do

  def mock_slug(stubs={})
    @mock_slug ||= mock_model(Slug, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all slugs as @slugs" do
      Slug.should_receive(:find).with(:all).and_return([mock_slug])
      get :index
      assigns[:slugs].should == [mock_slug]
    end

    describe "with mime type of xml" do
  
      it "should render all slugs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Slug.should_receive(:find).with(:all).and_return(slugs = mock("Array of Slugs"))
        slugs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested slug as @slug" do
      Slug.should_receive(:find).with("37").and_return(mock_slug)
      get :show, :id => "37"
      assigns[:slug].should equal(mock_slug)
    end
    
    describe "with mime type of xml" do

      it "should render the requested slug as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Slug.should_receive(:find).with("37").and_return(mock_slug)
        mock_slug.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new slug as @slug" do
      Slug.should_receive(:new).and_return(mock_slug)
      get :new
      assigns[:slug].should equal(mock_slug)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested slug as @slug" do
      Slug.should_receive(:find).with("37").and_return(mock_slug)
      get :edit, :id => "37"
      assigns[:slug].should equal(mock_slug)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created slug as @slug" do
        Slug.should_receive(:new).with({'these' => 'params'}).and_return(mock_slug(:save => true))
        post :create, :slug => {:these => 'params'}
        assigns(:slug).should equal(mock_slug)
      end

      it "should redirect to the created slug" do
        Slug.stub!(:new).and_return(mock_slug(:save => true))
        post :create, :slug => {}
        response.should redirect_to(slug_url(mock_slug))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved slug as @slug" do
        Slug.stub!(:new).with({'these' => 'params'}).and_return(mock_slug(:save => false))
        post :create, :slug => {:these => 'params'}
        assigns(:slug).should equal(mock_slug)
      end

      it "should re-render the 'new' template" do
        Slug.stub!(:new).and_return(mock_slug(:save => false))
        post :create, :slug => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested slug" do
        Slug.should_receive(:find).with("37").and_return(mock_slug)
        mock_slug.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slug => {:these => 'params'}
      end

      it "should expose the requested slug as @slug" do
        Slug.stub!(:find).and_return(mock_slug(:update_attributes => true))
        put :update, :id => "1"
        assigns(:slug).should equal(mock_slug)
      end

      it "should redirect to the slug" do
        Slug.stub!(:find).and_return(mock_slug(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(slug_url(mock_slug))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested slug" do
        Slug.should_receive(:find).with("37").and_return(mock_slug)
        mock_slug.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slug => {:these => 'params'}
      end

      it "should expose the slug as @slug" do
        Slug.stub!(:find).and_return(mock_slug(:update_attributes => false))
        put :update, :id => "1"
        assigns(:slug).should equal(mock_slug)
      end

      it "should re-render the 'edit' template" do
        Slug.stub!(:find).and_return(mock_slug(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested slug" do
      Slug.should_receive(:find).with("37").and_return(mock_slug)
      mock_slug.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the slugs list" do
      Slug.stub!(:find).and_return(mock_slug(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(slugs_url)
    end

  end

end
