class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :search
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end
  
  def search
    @postal_code = search_params[:postal_code]
    @radius = search_params[:radius].to_i
    @location = find_location_for_postal_code(@postal_code)
    if @location 
      @messages = Message.find_by_location_and_radius(@location,@radius)
      render action: 'index'
    else
      @messages = Message.all
      render action: 'index'
    end
  end

  def show
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    # TODO change to user session after building login system
    @message.user = User.first
    
    if @message.save
      redirect_to :action => 'index', notice: t('.success')
    else
      render action: 'new'
    end
  end
  
  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :body)
  end

  def search_params
    params.require(:search).permit(:postal_code, :radius)
  end
end
