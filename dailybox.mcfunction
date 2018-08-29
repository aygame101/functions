#Répétition ; BOUCLE
#Cette fonction gère les récompences journalières que les joueurs obtiendront toutes les 20h

#Ajout de 1/ticks aux joueurs
  scoreboard players add * dailyboxTimer 1

#Don de l'item et détéction de son utilisation
  replaceitem entity @a[scores={dailyboxTimer=1440000..},distance=..100] hotbar.7 turtle_helmet{display:{Name:"\"§b§lDaily reward\""},Enchantments:[{lvl:1,id:"minecraft:curse_of_vanishing"}],HideFlags:63}
  execute as @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=1440000..}] run tellraw @s ["",{"text":"§7§lServer§r §8➤ "},{"text":"Récompence journalière reçue !","color":"green"}]
  execute as @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=1440000..}] run scoreboard players set @s getType 2
  execute as @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=1440000..}] run scoreboard players add @s getUCoins 150
  execute as @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=1440000..}] run scoreboard players add @s getXP 100
  execute as @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=1440000..}] run scoreboard players set @s dailyboxTimer 0
  replaceitem entity @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:7b,id:"minecraft:turtle_helmet"}]},scores={dailyboxTimer=..1439999}] hotbar.7 air
  replaceitem entity @a[distance=..100,gamemode=adventure,nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]}] armor.head air
