class TicketsController < ApplicationController
  def create
    require 'faker'
    @ticket = Ticket.new(
      title: Faker::Hacker.abbreviation,
      description: Faker::Hacker.say_something_smart
    )
    # peut etre autre possibilite avec user.tickets.count
    tickets = Ticket.all
    tickets_by_user = Hash.new(0)
    tickets.each do |ticket|
      tickets_by_user[ticket.user_id] += 1
    end
    user_available = tickets_by_user.sort_by { |key, value| value }.first
    user_id = user_available.keys[0]
    @ticket.user = User.where(id: user_id)
    @ticket.save
  end

  def index
    if params[:query].present?
      @tickets = Ticket.search_by_description(params[:query])
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
