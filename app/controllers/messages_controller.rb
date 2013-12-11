class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :search
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end
  
  def search
    @keyword = search_params[:keyword]
    @postal_code = search_params[:postal_code]
    @radius = search_params[:radius].to_i
    @location = find_location_for_postal_code(@postal_code)
    if @location 
      @messages = Message.find_by_location_and_radius(@location,@radius)
      render action: 'index'
    else
      #@messages = Message.all
      render action: 'index'
    end
  end

  def show
  end
  
  def new
    @message = Message.new
    cat = Category.new(id:0,title:t('messages.new.category_placeholder'))
    @category_options = Category.all(:order=>'title')
    @category_options.unshift(cat)
    #@category_options = [[t('messages.new.category_placeholder'), 0, {:selected => true, :disabled => true}]]
    #Category.all(:order => "title").each{ |category| @category_options.push([category.title,category.id]) }
  end
  
  def create
    @message = Message.new(message_params)
    # TODO change to user session after building login system
    @message.user = User.first
    
    if @message.save
      redirect_to :action => 'show', :id => @message.id, :success => "1"
    else
      render action: 'new'
    end
  end
  
  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :body, :category_id)
  end

  def search_params
    params.require(:search).permit(:keyword, :postal_code, :radius)
  end
end
