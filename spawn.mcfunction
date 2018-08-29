#Répétition ; BOUCLE
#Cette fonction sert à controler toutes les connections, ici sera donc ;
#Tout le code pour la première connection des nouveaux joueurs
#Tout le code pour la connection des "anciens" joueurs

#Attribution de l'ID
  #Messages de bienvenue, car le joueur n'a pas de score ID défini
  #Le premier message est pour tous les "anciens" joueurs, alors que le second est pour le nouveau
    execute as @a unless score @s ID matches 1.. run tellraw @a[scores={ID=1..}] [{"text":"§7§lServeur§r §8➤ "},{"text":"Bienvenue à ","color":"green"},{"selector":"@s"},{"text":" sur Aycraft !","color":"green"}]
    execute as @a unless score @s ID matches 1.. run tellraw @s [{"text":"§7§lServeur§r §8➤ "},{"text":"Bienvenue sur Aycraft, ","color":"green"},{"selector":"@s"},{"text":", passe d'agréables moments ici!","color":"green"}]
  #Attribution d'un ID
    execute as @a unless score @s ID matches 1.. run scoreboard players add #maxID ID 1
    execute as @a unless score @s ID matches 1.. run scoreboard players operation @s ID = #maxID ID

#Type de connection
  scoreboard players set @a unplayedTimeType -1
  
#Remise à 0 des joueurs qui se connectent
  gamemode adventure @a[scores={leaveGame=1..},gamemode=!creative]
  spawnpoint @a[scores={leaveGame=1..}] 1 32 113
  tp @a[scores={leaveGame=1..}] 1 32 113 -90 0
  clear @a[scores={leaveGame=1..},gamemode=!creative]
#Parametrages des joueurs en gm1 (Pour éviter qu'un membre du staff avec un bloc ayant un nbt qui crash-co rage...)
  gamemode adventure @a[scores={leaveGame=1..},gamemode=creative]

#Messages
  #Titles
    title @a[scores={leaveGame=1..}] title ["",{"text":"▶ ","color":"dark_red"},{"text":"Aycraft","color":"gold"},{"text":" ◀","color":"dark_red"}]
    execute as @a[scores={leaveGame=1..}] run title @s subtitle ["",{"text":"▶ ","color":"dark_purple"},{"text":"Bienvenue, ","color":"yellow"},{"selector":"@s","color":"purple"},{"text":" ◀","color":"dark_purple"}]
    execute as @a[scores={leaveGame=1..}] run title @s actionbar [{"text":"Amuses-toi bien !","color":"dark_green","underlined":"true"}]
  #Temps de "non-jeu"
    #Operations
      #Jours
        scoreboard players set @a[scores={leaveGame=1..}] unplayedDivisor 1728000
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDay = @s unplayedTicks
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDay /= #1728000 SCORES
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDivisor *= @s unplayedDay
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedTicks -= @s unplayedDivisor
      #Heures
        scoreboard players set @a[scores={leaveGame=1..}] unplayedDivisor 72000
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedHour = @s unplayedTicks
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedHour /= #72000 SCORES
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDivisor *= @s unplayedHour
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedTicks -= @s unplayedDivisor
      #Minutes
        scoreboard players set @a[scores={leaveGame=1..}] unplayedDivisor 1200
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedMin = @s unplayedTicks
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedMin /= #1200 SCORES
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDivisor *= @s unplayedMin
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedTicks -= @s unplayedDivisor
      #Secondes
        scoreboard players set @a[scores={leaveGame=1..}] unplayedDivisor 20
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedSec = @s unplayedTicks
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedSec /= #20 SCORES
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedDivisor *= @s unplayedSec
        execute as @a[scores={leaveGame=1..}] run scoreboard players operation @s unplayedTicks -= @s unplayedDivisor
    #Messages
      #Attribution du type de message correspondant
      execute as @a[scores={leaveGame=1..}] if score @s unplayedSec matches 1.. run scoreboard players set @s unplayedTimeType 0
      execute as @a[scores={leaveGame=1..}] if score @s unplayedMin matches 1.. run scoreboard players set @s unplayedTimeType 1
      execute as @a[scores={leaveGame=1..}] if score @s unplayedHour matches 1.. run scoreboard players set @s unplayedTimeType 2
      execute as @a[scores={leaveGame=1..}] if score @s unplayedDay matches 1.. run scoreboard players set @s unplayedTimeType 3
      #Secondes
        execute as @a[scores={leaveGame=1..,unplayedTimeType=0}] run tellraw @s ["",{"text":"§7§lServeur§r §8▶ "},{"text":"Votre dernière activitée remonte à ","color":"green"},{"score":{"objective":"unplayedSec","name":"@s"},"color":"gold"},{"text":"sec.","color":"green"}]
      #Minutes
        execute as @a[scores={leaveGame=1..,unplayedTimeType=1}] run tellraw @s ["",{"text":"§7§lServeur§r §8▶ "},{"text":"Votre dernière activitée remonte à ","color":"green"},{"score":{"objective":"unplayedMin","name":"@s"},"color":"gold"},{"text":"min et ","color":"green"},{"score":{"objective":"unplayedSec","name":"@s"},"color":"gold"},{"text":"sec.","color":"green"}]
      #Heures
        execute as @a[scores={leaveGame=1..,unplayedTimeType=2}] run tellraw @s ["",{"text":"§7§lServeur§r §8▶ "},{"text":"Votre dernière activitée remonte à ","color":"green"},{"score":{"objective":"unplayedHour","name":"@s"},"color":"gold"},{"text":"h ","color":"green"},{"score":{"objective":"unplayedMin","name":"@s"},"color":"gold"},{"text":"min et ","color":"green"},{"score":{"objective":"unplayedSec","name":"@s"},"color":"gold"},{"text":"sec.","color":"green"}]
      #Jours
        execute as @a[scores={leaveGame=1..,unplayedTimeType=3}] run tellraw @s ["",{"text":"§7§lServer§r §8▶ "},{"text":"Votre dernière activitée remonte à ","color":"green"},{"score":{"objective":"unplayedDay","name":"@s"},"color":"gold"},{"text":"j ","color":"green"},{"score":{"objective":"unplayedHour","name":"@s"},"color":"gold"},{"text":"h ","color":"green"},{"score":{"objective":"unplayedMin","name":"@s"},"color":"gold"},{"text":"min et ","color":"green"},{"score":{"objective":"unplayedSec","name":"@s"},"color":"gold"},{"text":"sec.","color":"green"}]

#Remise à 0 du score qui détecte la reconnection
  scoreboard players add @a[scores={leaveGame=1..}] leaveGame 0

#Temps non joué
  scoreboard players add * unplayedTicks 1
  scoreboard players set @a[scores={leaveGame=0},tag=!AFK] unplayedTicks 0
  scoreboard players set @e[type=!player,scores={unplayedTicks=1..}] unplayedTicks 0

