class SlugsController < ApplicationController
  # GET /slugs
  # GET /slugs.xml
  def index
    @slugs = Slug.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slugs }
    end
  end

  # GET /slugs/1
  # GET /slugs/1.xml
  def show
    @slug = Slug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slug }
    end
  end

  # GET /slugs/new
  # GET /slugs/new.xml
  def new
    @slug = Slug.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slug }
    end
  end

  # GET /slugs/1/edit
  def edit
    @slug = Slug.find(params[:id])
  end

  # POST /slugs
  # POST /slugs.xml
  def create
    @slug = Slug.new(params[:slug])

    respond_to do |format|
      if @slug.save
        flash[:notice] = 'Slug was successfully created.'
        format.html { redirect_to(@slug) }
        format.xml  { render :xml => @slug, :status => :created, :location => @slug }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slugs/1
  # PUT /slugs/1.xml
  def update
    @slug = Slug.find(params[:id])

    respond_to do |format|
      if @slug.update_attributes(params[:slug])
        flash[:notice] = 'Slug was successfully updated.'
        format.html { redirect_to(@slug) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slugs/1
  # DELETE /slugs/1.xml
  def destroy
    @slug = Slug.find(params[:id])
    @slug.destroy

    respond_to do |format|
      format.html { redirect_to(slugs_url) }
      format.xml  { head :ok }
    end
  end
end
