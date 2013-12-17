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
    # @messages = Message.search_by_keyword(@keyword)
    # message_ids = @messages.all.map(&:id)
    # @comments = Comment.search_by_keyword(@keyword).where("message_id not in (?)",message_ids.join(','))

    if @keyword.present? && @postal_code.present? && !@location
      # Keyword and postal_code provided but postal_code is invalid
      @search_error = t 'search.error.location'
    elsif @keyword.present? && @location
      # Keyword and location search function
      @messages = Message.find_by_keyword_location_and_radius(@keyword,@location,@radius).order('distance')
    elsif @keyword.present?
      # Keyword provided
      @messages = Message.find_by_keyword(@keyword)#order by comments count
    elsif @location
      # Provided postal_code is valid
      @messages = Message.find_by_location_and_radius(@location,@radius)
    elsif @postal_code.present? && !@location
      # Provided postal_code is invalid
      @search_error = t 'search.error.location'
    else
      # Nothing has been provided
      @search_error = t 'search.error.keyword_and_location'
    end
    render action: 'index'
  end

  def show
  end
  
  def new
    @message = Message.new
    @category_options = Category.all(:order=>'title')
    @select = false
  end
  
  def create
    @message = Message.new(message_params)
    # TODO change to user session after building login system
    @message.user = User.first
    
    if @message.save
      redirect_to :action => 'show', :id => @message.id, :success => "1"
    else
      @category_options = Category.all(:order=>'title')

      @select = false
      if(@message.category_id.present?)
        @select = @message.category_id
      end

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
