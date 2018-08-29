#Répétition : Boucle
#But : Donner les effet/ cosmetiques aux joeurs, il y a donc
#speed
#JumpBoost
#tapis Volant
#eviter que les cosmetiques fct ors du spawn

#speed
	#trigger
		scoreboard players enable @a CosmetiqueSpawn
		tag @a[scores={CosmetiqueSpawn=1},tag=!SSpeed] add SSpeedOn
		tag @a[scores={CosmetiqueSpawn=1},tag=SSpeed] add SSpeedOff

	#give
		effect give @a[tag=SSpeed] minecraft:speed 3 4 true
		tellraw @a[tag=SSpeedOn] ["",{"text":"➤ Le speed a été activé","color":"green"}]
		tag @a[tag=SSpeedOn] add SSpeed
		tag @a[tag=SSpeedOn] remove SSpeedOn

	#retrait
		effect clear @a[tag=SSpeedOff] speed
		execute as @a[tag=SSpeed] run tellraw @a[tag=SSpeedOff] ["",{"text":"➤ Le speed a été désactivé","color":"red"}]
		tag @a[tag=SSpeedOff] remove SSpeed
		tag @a[tag=SSpeedOff] remove SSpeedOff


#Jump Boost
	#trigger
		tag @a[scores={CosmetiqueSpawn=2},tag=!SJumpBoost] add SJumpBoostOn
		tag @a[scores={CosmetiqueSpawn=2},tag=SJumpBoost] add SJumpBoostOff

	#give
		effect give @a[tag=SJumpBoost] minecraft:jump_boost 3 4 true
		tellraw @a[tag=SJumpBoostOn] ["",{"text":"➤ Le jump boost a été activé","color":"green"}]
		tag @a[tag=SJumpBoostOn] add SJumpBoost
		tag @a[tag=SJumpBoostOn] remove SJumpBoostOn

	#retrait
		effect clear @a[tag=SJumpBoostOff] jump_boost
		execute as @a[tag=SJumpBoost] run tellraw @a[tag=SJumpBoostOff] ["",{"text":"➤ Le jump boost a été désactivé","color":"red"}]
		tag @a[tag=SJumpBoostOff] remove SJumpBoost
		tag @a[tag=SJumpBoostOff] remove SJumpBoostOff


#reset tag si pas tag=Spawn
	tag @a[tag=!Spawn] add SSpeedOff
	tag @a[tag=!Spawn] add SJumpBoostOff

#reset trigger
	scoreboard players set @a CosmetiqueSpawn 0
