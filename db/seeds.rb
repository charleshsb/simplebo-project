puts "starting seed"
User.destroy_all
Ticket.destroy_all
Comment.destroy_all

jeremy = User.create(email: "jeremy.kenigsman@simplebo.fr", password: "qsdfghjklm", first_name: "Jérémy", last_name: "Kenigsman")

puts "seed completed"
