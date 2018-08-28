#Répétition ; BOUCLE
#Cette fonction sert à controler tout le spawn, ici sera donc ;
#Tout le code pour la première connection des nouveaux joueurs
#Tout le code pour la connection des "anciens" joueurs
#Tout le code pour la protection des joueurs dans le perimètre du spawn
#Toutes les fonctions liées au spawn

#Attribution de l'ID
  #Messages de bienvenue, car le joueur n'a pas de score ID défini
  #Le premier message est pour tous les "anciens" joueurs, alors que le second est pour le nouveau
    execute as @a unless score @s ID matches 1.. run tellraw @a[scores={ID=1..}] [{"text":"§7§lServeur§r §8➤ "},{"text":"Bienvenue à ","color":"green"},{"selector":"@s"},{"text":" sur Aycraft !","color":"green"}]
    execute as @a unless score @s ID matches 1.. run tellraw @s [{"text":"§7§lServeur§r §8➤ "},{"text":"Bienvenue sur Aycraft, ","color":"green"},{"selector":"@s"},{"text":", passe d'agréables moments ici!","color":"green"}]
  #Attribution d'un ID
    execute as @a unless score @s ID matches 1.. run scoreboard players add #maxID ID 1
    execute as @a unless score @s ID matches 1.. run scoreboard players operation @s ID = #maxID ID
