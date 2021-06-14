extends Node




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet=preload('res://scenes/Bullet.tscn')
var rotation_speed = 250
var player:KinematicBody2D
var my_ships=[]
var enemy_ships=[]
var plr_sounds=[]
var l_half
var enemy_sounds=[]
var r_half
var halfs:Dictionary
var r_selected=0
var l_selected=1
var field
signal take_dmg
var r_hp=0
var l_hp=0
var enemys=0
var max_enemys=6
var level
var score=0
var high_score=0
var r_panel
var l_panel
signal reset_type
signal scored_high
# Called when the node enters the scene tree for the first time.

func _ready():
	for i in range(4):
		my_ships.append(load("res://ship_types_resource/ship_type"+str(i)+".tres").duplicate())
	for i in range(5,10):
		enemy_ships.append(load("res://ship_types_resource/ship_type"+str(i)+".tres").duplicate())
	for i in range(1,6):
		enemy_sounds.append(load("res://SFX/NPC_Spaceship_Gun-00"+str(i)+".wav").duplicate())
	for i in range(1,6):
		plr_sounds.append(load("res://SFX/Player_Spaceship_Shot-00"+str(i)+".wav").duplicate())	
			
