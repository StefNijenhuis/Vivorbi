class MessagesController < ApplicationController
  def index
    # load all messages for index
    @user = User.first
    @messages = Message.all
  end
  
  def search
    # get lat and long from api request with postal_code from params
    location = find_location_for_postal_code(search_params[:postal_code])[:resource]
    # get radius from params
    radius = search_params[:radius].to_i
    @messages = Message.find_by_location_and_radius(location[:latitude],location[:longitude],radius)
    render action: 'index'
  end

  def show
    @user = User.first
    @message = Message.find(params[:id])
    # TODO create view
  end
  
  def new
    @user = User.first
    @message = Message.new
    # TODO create view
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
      @user = User.first
      render action: 'new'
      #format.html { render action: 'new' }
      #format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:title, :body)
  end

  def search_params
    params.require(:search).permit(:postal_code, :radius)
  end
end
