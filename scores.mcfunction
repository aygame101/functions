#Répétition ; RÉGULIÈRE/MANUELLE
#Cette fonction sert à ajouter tous les scores et la majeure partie des joueurs fictifs, ici sera donc ;
#Toutes les attributions de score des joueurs fictifs, dont le nom commencera toujours par un #
#Tous les ajouts de scores dont le serveur aura besoin

#Spawn
  #ID
    scoreboard objectives add ID dummy
    execute unless score #maxID ID matches 0.. run scoreboard players add #maxID 0
