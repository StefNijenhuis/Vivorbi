class MessagesController < ApplicationController
  def index
    # load all messages for index
    @user = User.first
    @messages = Message.all
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
      render action: 'new'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:title, :body)
  end
end
