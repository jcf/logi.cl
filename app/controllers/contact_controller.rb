class ContactController < ApplicationController

  def index
    new
    render :action => 'new'
  end

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html
    end
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    if request.xhr?
      @contact = Contact.new(params[:contact])
      if @contact.save
        response = 'Your message has been sent. Thanks!'
        flash.now[:success] = response
      else
        response = '<b>Sorry</b>. Your message could not be sent. Please check you have provided your <b>name</b> and <b>message</b> and that your <b>email</b> address is <b>valid</b>.'
        flash.now[:failure] = response
      end
      render :partial => "ajax_flash", :locals => {:status => flash.keys.to_s, :response => flash.values.to_s}
    else
      @contact = Contact.new(params[:contact])

      respond_to do |format|
        if @contact.save
          flash[:notice] = 'Contact was successfully created.'
          format.html { redirect_to(@contact) }
          format.xml  { render :xml => @contact, :status => :created, :location => @contact }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

end
