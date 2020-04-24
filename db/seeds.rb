puts "starting seed"
Comment.destroy_all
Ticket.destroy_all
User.destroy_all

jeremy = User.create(email: "jeremy.kenigsman@simplebo.fr", password: "qsdfghjklm", first_name: "Jérémy", last_name: "Kenigsman")
nicolas = User.create(email: "nicolas.leroy@simplebo.fr", password: "123456", first_name: "Nicolas", last_name: "Leroy")
charles = User.create(email: "charles.stas@simplebo.fr", password: "123456", first_name: "Charles", last_name: "Stas")
sophie = User.create(email: "sophie.davant@simplebo.fr", password: "123456", first_name: "Sophie", last_name: "Davant")

ticket_1 = Ticket.new(title:"Issue 1", description:"please help me with css", done:false, user: jeremy)
ticket_1.save
ticket_2 = Ticket.new(title:"Issue 2", description:"please help me with html", done:true, user: nicolas)
ticket_2.save
ticket_3 = Ticket.new(title:"Issue 3", description:"please help me with javascript", done:false, user: jeremy)
ticket_3.save
ticket_4 = Ticket.new(title:"Issue 4", description:"please help me with heroku", done:false, user: charles)
ticket_4.save
ticket_5 = Ticket.new(title:"Issue 5", description:"please help me with API", done:false, user: nicolas)
ticket_5.save
ticket_6 = Ticket.new(title:"Issue 6", description:"please help me with DB", done:false, user: sophie)
ticket_6.save

puts "seed completed"
