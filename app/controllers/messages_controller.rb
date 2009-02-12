class MessagesController < ApplicationController

  def index
    render :action => 'new'
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to root_url }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        flash[:failure] = @message.errors
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

end
