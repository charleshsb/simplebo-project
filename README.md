Projet test technique pour Simplébo

Explications choix d'implémentations :
- un user a un id, first name, last name, un email et un password
- un ticket a un id, titre, une description et un stats (done) qui renvoit un booléen et un user_id
- un ticket est assigné à un user et un user peut avoir plusieurs tickets
- un comment a un champs text, un user_id et un ticket_id
- un comment est créée par un user et assigné à un ticket
- un user peut avoir créée plusieurs comments
- un ticket peut avoir plusieurs comments

Explications choix des gems :
- devise pour gérer l'authentification, gem la plus réputée dans ce domaine.
- faker pour générer des titre et description aléatoires à chaque nouveau ticket
- pg-search pour faire une recherche en passant par le serveur, en attendant de développer la feature en pure JS
- whenever pour gérer les taches CRON, il s'avère qu'il n'est pas supporté par keroku
