
require 'bundler'                                                   
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'                                                              # --> appels des gem puis des autres pages





puts "|-------------------------------------------------|
|       'Bienvenue sur 'TU meurs ou pas !?' !     |
|Le but du jeu est de casser la gueule aux autres!|                  
|-------------------------------------------------|"                                       # --> Message de présentation du jeu
  puts"===================================================\n\n"    
      
  puts "Création de ton joueur ! \n\n"
  
  puts"========================\n\n"                                                       # --> Retour a la ligne, avec caractere pour un meilleur visu de l'interface

  puts "Quel est le nom de ton joueur ?\n"

  print "--> "                                                        
  name1 = gets.chomp                                                  
  puts "#{name1}, c'est pas très beau mais continuons \n\n"                                # --> Création du personnage de l'utilisateur avec sa réponse donné
  player1 = HumanPlayer.new(name1)

  puts"========================\n\n"
  
  Romu = Player.new("Romu")
  Quentin = Player.new("Quentin")                                                          # --> Création des "bots" ou ennemies
  ennemies = [Romu, Quentin]                                                               # --> stocker dans un array pour pouvoir les appeler dans des boucle







  while player1.life_points >0 && (Romu.life_points > 0 || Quentin.life_points >0)         # --> début du jeu     
    puts "\n\n"                                                                            # --> Boucle pour l'éxécution de notre Jeu avec conditions si les joueurs sont en vie





    puts "Voici l'état des joueurs: \n\n"
    
    if player1.life_points > 0                                                             # --> affiche l'état si le jouer est vivants
        puts player1.show_state
    else puts "#{player1} est mort "
    end
    ennemies.each_with_index do |bot, index|                                               # --> idem pour les bot (ennemies) mais dans une boucles
        if bot.life_points > 0 
        puts "#{bot.show_state} "
        else
            puts "#{bot.name} est mort "
        end
    end





   
    puts "\n\n"
    puts"=============================\n\n"

    puts "Quelle action veux-tu effectuer ?\n"
    puts "a --> chercher une meilleure arme.\n"                                             # --> Affichage du menu d'action pour l'utilisateur
    puts "s --> chercher a se soigner.\n\n"
    puts"=============================\n\n"



    puts "Attaquer un joueur en vue: "

        ennemies.each_with_index do |bot, index|                                            # --> affiche les choix d'attaque et l'état        
        if bot.life_points > 0                                                              # --> Boucle dans l'array ennemies
        puts "#{index} --> attaquer #{bot.name} qui a #{bot.life_points} points de vie."    # --> Passe sur chaque objet de l'array crée, pour mettre a jour points de vie
        else
        puts "#{index} --> impossible d'attaquer #{bot.name}, qui est mort comme une merde ! "
        end

    end

    puts "\n\n"


    puts "Quel est ton choix #{player1.name} ? \n"
    print "--> "
    choice = gets.chomp                                                                      # --> choix du joueur
    puts "\n\n"
    puts "Phase de Combat : \n\n"

   
    if choice == "a"                                                                         # --> Boucle if pour diriger l'utilisateur selon sont choix
        player1.search_weapon                                                                # --> Appel de la méthode search_weapon crée dans player
        
      elsif choice == "s"
        player1.search_health_pack                                                           # --> Appel de la méthode search_health_pack crée dans player


      elsif choice == "1"                                     
          if Quentin.life_points > 0                                                         # --> Condition pour validé l'attaque sur Quentin
          player1.attacks(Quentin)                                                           # --> Si la condition est validé il attaque
          else
          puts "#{Quentin.name} est mort."                                                   # --> Si elle n'est pas validé il explique pourquoi
          end
        
        

      elsif choice == "0"
        if Romu.life_points > 0                                                              # --> Condition pour validé l'attaque sur Romu
            puts "\n\n"                   
            player1.attacks(Romu)                                                            # --> Si la condition est validé il attaque       
            puts "\n\n"
        else
            puts "#{Romu.name} est mort."                                                    # --> Si elle n'est pas validé il explique pourquoi
        end

      else
        "Erreur"                                                                             # --> Si autre choses est écrit, return un message d'erreur
    end

      ennemies.each do |bot|                                                                 # --> Passe sur chaque objet de l'array
        if bot.life_points > 0                                                               # --> Si le bot est en vie il peut faire une action
         puts "\n\n"
         bot.attacks(player1)                                                                # --> le bot attaque l'utilisateur
         puts "\n\n"
        end
      end

                                                
  end        
        

  if player1.life_points <= 0                                                               # --> Condition Si tu as plus de vie
    puts "#{player1.name} tu es vraiment trop nul de perdre contre deux bots qui tape de 1 à 6 alors que tu as 100 points de vie et des armes.."   # --> Affiche que tu as plus de points de vie, tu as perdu la partie prend fin
  elsif Quentin.life_points <= 0 && Romu.life_points <= 0                                   # --> si Tu tue les 2 bots
    puts "Victoire de #{player1.name} t'es chaud bg ! "                                     # --> Affiche que tu as win
  end


#binding.pry                                                            
#puts "end"