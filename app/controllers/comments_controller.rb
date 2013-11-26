class CommentsController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.new(comment_params)
    @comment.user = User.last
    @comment.save
    redirect_to message_path(@message)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
