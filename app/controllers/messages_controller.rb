class MessagesController < ApplicationController

  def index
    redirect_to :action => 'new'
    # new
    # render :action => "new"
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        flash[:success] = 'Message was sent successfully.'
        format.html { redirect_to root_url }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

end
