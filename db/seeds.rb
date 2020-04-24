puts "starting seed"
User.destroy_all
Ticket.destroy_all
Comment.destroy_all

jeremy = User.create(email: "jeremy.kenigsman@simplebo.fr", password: "qsdfghjklm", first_name: "Jérémy", last_name: "Kenigsman")
nicolas = User.create(email: "nicolas.leroy@simplebo.fr", password: "123456", first_name: "Nicolas", last_name: "Leroy")
charles = User.create(email: "charles.stas@simplebo.fr", password: "123456", first_name: "Charles", last_name: "Stas")
sophie = User.create(email: "sophie.davant@simplebo.fr", password: "123456", first_name: "Sophie", last_name: "Davant")

puts "seed completed"
