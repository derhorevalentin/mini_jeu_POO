require 'bundler'                                                      # ----> "Appel les Gems séléctionnées."
Bundler.require
require 'pry'
                                                                          
require_relative 'lib/game'                                            # ----> "Création du lien entre game.rb, player.rb et app.rb"
require_relative 'lib/player'

player1 = Player.new("David")                                          # ----> "Création d'objet"
player2 = Player.new("Lulu")



while player1.life_points > 0 && player2.life_points > 0               # ----> "Boucle while , appel la méthode "life_points", doit être superieur à 0.""

  puts "Voici l'état de nos joueurs: "                                 # ----> "Applique la méthode "show_state", montre l'état d'un joueur."
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque :"                                # ----> "Appel la méthode "attacks", player1 lance l'attaque sur le player2 // si les pdv du player attaqué sont a 0 ou inferieur la boucle prends fin 
  player1.attacks(player2)
    if player2.life_points <= 0
    break
    end


  puts "Voici l'état de nos joueurs: "                                 # ----> "Applique la méthode "show_state", montre l'état d'un joueur."
  player1.show_state
  player2.show_state
 
  puts "Passons à la phase d'attaque :"                                # ----> "Appel la méthode "attacks", player2 lance l'attaque sur le player1 // si les pdv du player attaqué sont a 0 ou inferieur la boucle prends fin 
  player2.attacks(player1)
  if player1.life_points <= 0
  break
  end
end



#binding.pry                                                            
#puts "end"