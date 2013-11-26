class MessagesController < ApplicationController
  def index
    # load all messages for index
    @messages = Message.all
  end

  def show
    @message = Message.find(:id)
    # TODO create view
  end

  def new
    @message = Message.new
    # TODO create view
  end

  def create
    @message = Message.new(request_params)
    # TODO change to user session after building login system
    @message.user = User.first

    if @message.save
      redirect_to :action => 'index', notice: t('.success')
    else
      render action: 'new'
    end
  end

  private
  def request_params
    params.require(:message).permit(:title, :body)
  end
end
