#Répétition ; RÉGULIÈRE/MANUELLE
#Cette fonction sert à ajouter tous les scores et la majeure partie des joueurs fictifs, ici sera donc ;
#Toutes les attributions de score des joueurs fictifs, dont le nom commencera toujours par un #
#Tous les ajouts de scores dont le serveur aura besoin

#SCORES
  scoreboard objectives add SCORES dummy
  scoreboard players set #20 SCORES 20
  scoreboard players set #1200 SCORES 1200
  scoreboard players set #72000 SCORES 72000
  scoreboard players set #1728000 SCORES 1728000

#Login
  scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game
  scoreboard objectives add unplayedTimeType dummy
  scoreboard objectives add unplayedDivisor dummy
  scoreboard objectives add unplayedTicks dummy
  scoreboard objectives add unplayedSec dummy
  scoreboard objectives add unplayedMin dummy
  scoreboard objectives add unplayedHour dummy
  scoreboard objectives add unplayedDay dummy
  scoreboard objectives add ID dummy
  execute unless score #maxID ID matches 0.. run scoreboard players add #maxID 0
