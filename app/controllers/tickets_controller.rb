class TicketsController < ApplicationController
  def create
    # @ticket = Ticket.new(passer les faker)
    # @ticket.user = mettre le user qui a le moins de tickets
    @ticket.save
  end

  def index
    if params[:query].present?
      @tickets = Ticket.search_by_title_and_address(params[:query])
    else
      @tickets = Ticket.where(done: false)
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comments = Comment.where(ticket: @ticket).order("created_at DESC")
    @comment = Comment.new
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(done: true)
    @ticket.save
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:done)
  end
end
