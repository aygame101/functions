    execute if entity @a[tag=!AFK] run scoreboard objectives add level dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add XP2UP dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add XP0 dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add XP1 dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add XP2 dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add XP3 dummy
    execute if entity @a[tag=!AFK] run scoreboard objectives add xpDeath minecraft.custom:minecraft.time_since_death
  #Players
    execute if entity @a[tag=!AFK] as @a unless score @s level matches 0.. run scoreboard players add @s level 0
    execute if entity @a[tag=!AFK] run scoreboard players set @a XP2UP 0
    execute if entity @a[tag=!AFK] run scoreboard players set #68 XP2UP 68
    execute if entity @a[tag=!AFK] run scoreboard players set #87 XP2UP 87
    execute if entity @a[tag=!AFK] run scoreboard players set #18 XP2UP 18

#fml = x⁴+68x³+87x²+18x+39
  execute as @a run scoreboard players operation @s XP0 = @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  execute as @a run scoreboard players operation @s XP0 *= @s level
  #
  execute as @a run scoreboard players operation @s XP1 = @s level
  execute as @a run scoreboard players operation @s XP1 *= @s level
  execute as @a run scoreboard players operation @s XP1 *= @s level
  execute as @a run scoreboard players operation @s XP1 *= #68 XP2UP
  #
  execute as @a run scoreboard players operation @s XP2 = @s level
  execute as @a run scoreboard players operation @s XP2 *= @s level
  execute as @a run scoreboard players operation @s XP2 *= #87 XP2UP
  #
  execute as @a run scoreboard players operation @s XP3 = @s level
  execute as @a run scoreboard players operation @s XP3 *= #18 XP2UP
  #
  execute as @a run scoreboard players set @s XP2UP 39
  execute as @a run scoreboard players operation @s XP2UP += @s XP0
  execute as @a run scoreboard players operation @s XP2UP += @s XP1
  execute as @a run scoreboard players operation @s XP2UP += @s XP2
  execute as @a run scoreboard players operation @s XP2UP += @s XP3

#Pas d'xp_orb
  kill @e[type=experience_orb]

#Levels
  execute as @a[scores={level=0..200}] if score @s XP >= @s XP2UP run tag @s add lvlup
  execute as @a[scores={level=0..200},tag=lvlup] run scoreboard players add @s level 1
  execute as @a[scores={level=0..200},tag=lvlup] run scoreboard players operation @s XP -= @s XP2UP

#FINAL
  execute as @a[tag=lvlup,scores={language=0}] run tellraw @s ["",{"text":"§7§lServer§r §8▶ "},{"text":"Congrats! You reached level ","color":"green"},{"score":{"objective":"level","name":"@s"},"color":"gold","bold":"true"},{"text":" !","color":"green"}]
  execute as @a[tag=lvlup,scores={language=1}] run tellraw @s ["",{"text":"§7§lServeur§r §8▶ "},{"text":"Bravo ! Tu passe au niveau ","color":"green"},{"score":{"objective":"level","name":"@s"},"color":"gold","bold":"true"},{"text":" !","color":"green"}]
  execute as @a[tag=lvlup,scores={level=0..200}] run playsound minecraft:entity.player.levelup master @s
  tag @a remove lvlup
#Max XP = 2147483647 (2'147'483'647) = Level 200 -> 201
