#Répétition ; BOUCLE/RÉGULIÈRE
#Cette fonction sert à calculer l'XP nécessaire pour passer au niveau et fait les pasages de niveaux, ici sera donc ;
#Tous les calculs en rapport avec l'XP
#Tous ce qui est en rapport avec les passages de niveaux
#Le maximum d'XP qui sera requise sera 2147483647 (2,147,483,647) = Level 200 -> 201

#Pour que tous les joueurs soient minimum niveau°0 (au lieu de niveau°x)
  execute as @a unless score @s level matches 0.. run scoreboard players add @s level 0

#formule => ƒ(x) = x⁴+68x³+87x²+18x+39
  execute as @a run scoreboard players operation @s XP0 = @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  #
  execute as @a run scoreboard players operation @s XP1 = @s level
  execute as @a run scoreboard players operation @s XP1 *= @s level
  execute as @a run scoreboard players operation @s XP1 *= @s level
  execute as @a run scoreboard players operation @s XP1 *= #68 SCORES
  #
  execute as @a run scoreboard players operation @s XP2 = @s level
  execute as @a run scoreboard players operation @s XP2 *= @s level
  execute as @a run scoreboard players operation @s XP2 *= #87 SCORES
  #
  execute as @a run scoreboard players operation @s XP3 = @s level
  execute as @a run scoreboard players operation @s XP3 *= #18 SCORES
  #
  execute as @a run scoreboard players set @s XP2UP 39
  execute as @a run scoreboard players operation @s XP2UP += @s XP0
  execute as @a run scoreboard players operation @s XP2UP += @s XP1
  execute as @a run scoreboard players operation @s XP2UP += @s XP2
  execute as @a run scoreboard players operation @s XP2UP += @s XP3

#Pas d'xp_orb sur le terrain :3
  kill @e[type=experience_orb]

#Passage du niveau
  execute as @a[scores={level=0..200}] if score @s XP >= @s XP2UP run tag @s add lvlup
  execute as @a[tag=lvlup] run scoreboard players add @s level 1
  execute as @a[tag=lvlup] run scoreboard players operation @s XP -= @s XP2UP
  execute as @a[tag=lvlup] run tellraw @s ["",{"text":"§7§lServeur§r §8▶ "},{"text":"Bravo ! Tu passe au niveau ","color":"green"},{"score":{"objective":"level","name":"@s"},"color":"gold","bold":"true"},{"text":" !","color":"green"}]
  execute as @a[tag=lvlup] run playsound minecraft:entity.player.levelup master @s
  tag @a remove lvlup
