class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.new(comment_params)
    @comment.ticket = @ticket
    @comment.user = current_user
    @comment.save
    redirect_to ticket_path(@ticket)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :ticket_id, :user_id)
  end
end
