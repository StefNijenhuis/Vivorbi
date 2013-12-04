class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    # load all messages for index
    @messages = Message.all
  end
  
  def search
    # get lat and long from api request with postal_code from params
    location = find_location_for_postal_code(search_params[:postal_code])
    # get radius from params
    @radius = search_params[:radius].to_i
    @postal_code = search_params[:postal_code]
    @messages = Message.find_by_location_and_radius(location['latitude'],location['longitude'].to_f,@radius)
    render action: 'index'
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
    if @message.user==nil
      render action: 'new'
    end

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
