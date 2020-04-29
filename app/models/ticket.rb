class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  include PgSearch::Model
  pg_search_scope :search_by_description,
    against: [:description],
    using: {
      tsearch: { prefix: true }
    }

  def self.automated_tickets
    ticket = Ticket.new(
      title: Faker::Hacker.abbreviation,
      description: Faker::Hacker.say_something_smart,
      done: false
    )
    tickets = Ticket.all
    tickets_by_user = Hash.new(0)
    tickets.each do |ticket|
      tickets_by_user[ticket.user.id] += 1
    end
    user_available = tickets_by_user.sort_by { |key, value| value }.first
    user_id = user_available[0]
    user_ok = User.find(user_id)
    ticket.user = user_ok
    ticket.save
    link = "https://simplebo-project.herokuapp.com/tickets/#{ticket.id}"
    ApplicationMailer.post_email(ticket.user, link).deliver
  end
end
