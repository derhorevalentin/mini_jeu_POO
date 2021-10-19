class Player

      
  @@all_player=[]
  
  attr_accessor :name, :life_points
  

  def initialize(name, life_points = 10)                                                 #----> Initialisation de le classe avec nombre de pv et nom du joueur.
                                
   @name = name
   @life_points = 10
   
  end

  def show_state                                                                         #----> Affiche l'état de santé des joueurs.

    puts "#{@name} a #{@life_points} points de vie."
    
  end

  def gets_damage(damage_received)
    
    @life_points -= damage_received                                                      #----> Inflige des dégats.
                       
    if @life_points <= 0                                                                 #----> Regarde si les pv sont égal à 0.
      puts "#{name} a été tué."
    end

  end

  def attacks(player) 
    damage = compute_damage
    puts "le joueur #{@name} attaque le joueur #{player.name}."                          #----> Un joueur lance une attaque.
    if damage > 4                                                                        #----> Si le lancé dé donne un résultat strictement supérieur à 4, la phrase ci dessous apparaît.
      
    else  
     puts "Il lui inflige #{damage} points de dégats."                                   #----> Sinon cette phrase est donnée.
     
    end
    player.gets_damage(damage)
  end

  def compute_damage

    return rand(1..6)                                                                    #----> Le lancé de dé est comprit entre 1 et 6.
    
  end
end

class HumanPlayer < Player                                                               #----> Héritage classe Player
  
  
      
        attr_accessor :weapon_level
        
        def initialize(name, life_points = 100)
          
        super(name)                                                                      #----> Fait appel au initialize de la classe Event
       
        @weapon_level = 1 # j'ai rajouté cette ligne
        @life_points = 100
       end
          
        
        def show_state
          puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
          
        end

        def compute_damage
          rand(1..6) * @weapon_level
        end

        def search_weapon 
          level_weapon = rand(1..6)                                                       #----> Le niveau de l'arme dépendra du résultat du lancé de dé.
          puts "Tu a trouvé une arme level #{level_weapon}"
          if level_weapon >= @weapon_level                                                #----> Si le niveau de son arme est supérieur au niveau de l'arme actuel, la nouvelle remplace l'ancienne.
            @weapon_level = level_weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
          else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."                 #----> Si le résultat du lancé de dé est inférieur, on garde l'ancienne arme et cette phrase apparaît.
          end
        end

        def search_health_pack
          health_pack = rand(1..6)                                                         #----> Lancement d'un dé, suivant le résultat, plusieurs possibilités.
          puts "tu as trouvé un pack de soin level #{health_pack}"       
          if health_pack == 1                                                              #----> Si le résultat est égal à 1, aucun pack de soin donné.
            puts "tu n'as rien trouvé, +0 points de vie dommage =( !"
          elsif health_pack == 6                                                           #----> Si le résultat est égal à 6, un pack de soin de +80 est donné.
            @life_points += 80
            puts "tu as trouvé un pack de +80 points de vie, cool =D !"
          else 
            @life_points += 50                                                             #----> Si le résultat est de 2 à 5, un pack de soin de +50 est donné.
            puts "Bravo, tu as trouvé un pack de +50 points de vie, tu vas mieux ;) !"
          end
          if @life_points > 100                                                            #----> Impossible de dépasser la barre des 100hp.
            @life_points = 100
          end
        end


end

#binding.pry                                                            
#puts "end"

{}