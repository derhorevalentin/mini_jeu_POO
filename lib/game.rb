

class Game 
  attr_accessor :human_player, :enemies

  def initialize(human)
    @human_player = HumanPlayer.new(human)
    @enemies = [Player.new("Vali"), Player.new("Lulu"), Player.new("Justin"), Player.new("Quentin")]
  end

  def kill_player(enemies_to_delete)
    @enemies.each_with_index do |bot|
    @enemies.delete_if(bot.life_points < 1)
    end
  
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end

  def show_players 
    @human_player.show_state
    puts "Il te reste #{@enemies.count} bots à battre.\n\n"
  end
  
  def menu 
    puts "Quelle action veux-tu effectuer ?\n"
    puts "a --> chercher une meilleure arme.\n"                                              # --> Affichage du menu d'action pour l'utilisateur
    puts "s --> chercher a se soigner.\n\n"
    puts"=============================\n\n"
    puts "Attaquer un joueur en vue: "
      enemies.each_with_index do |bot, index|                                              # --> affiche les choix d'attaque et l'état        
        if bot.life_points > 0                                                             # --> Boucle dans l'array ennemies
          puts "#{index} --> attaquer #{bot.name} qui a #{bot.life_points} points de vie."   # --> Passe sur chaque objet de l'array crée, pour mettre a jour points de vie
        else
          puts "#{index} --> impossible d'attaquer #{bot.name}, qui est mort comme une merde ! "
        end
      end
  end

    puts "\n\n"

  def menu_choice()
    puts "Quel est ton choix #{@human_player.name} ? \n"
    print "--> "
    choice = gets.chomp                                                                      # --> choix du joueur
    puts "\n\n"
    puts "Phase de Combat : \n\n"

   
    if choice == "a"                                                                         # --> Boucle if pour diriger l'utilisateur selon sont choix
    @human_player.search_weapon                                                                # --> Appel de la méthode search_weapon crée dans player
        
    elsif choice == "s"
    @human_player.search_health_pack                                                           # --> Appel de la méthode search_health_pack crée dans player


    elsif choice == "0"  || choice == "1" || choice == "2" || choice == "3"  
    position = choice.to_i
      if position <= @enemies.count-1
        if @enemies[position].life_points > 0
          @human_player.attacks(enemies[position])
            
        end
      else 
        "Erreur"
      end
    end         
  end
  
  def enemies_attack 
    puts "Les bots te fument"
    @enemies.each do |enemie|
      if enemie.life_points > 0 
        enemie.attacks(@human_player)
      end
    end
  end

  def end
  puts "End of the game bg"

    if @human_player.life_points > 0 && @enemies.each_with_index{|x, index| x.life_points < 1}

    puts "Bravo ! Tu as gagné bg, tu defouraille ! "
    else
    puts "Loser tu es vraiment trop nul de perdre contre des bots qui tape de 1 à 6 alors que tu as 100 points de vie et des armes et du soin.."
    end
  end
end
