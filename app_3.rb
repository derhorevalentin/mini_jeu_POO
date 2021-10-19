require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "|-------------------------------------------------|
|     'Bienvenue sur 'TU meurs ou pas !?' n°2     |
|Le but du jeu est de casser la gueule aux autres!|                  
|-------------------------------------------------|"                                       # --> Message de présentation du jeu
  puts"===================================================\n\n" 

print "Quel est ton nom ?\n "
print "--> "
name = gets.chomp
puts "Bonjour #{name}, tu vas jouer maintenant !\n\n"

my_game = Game.new(name)


while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice
	my_game.show_players
	my_game.enemies_attack
	my_game.show_players
 
end
my_game.end


binding.pry                                                            
puts "end"

