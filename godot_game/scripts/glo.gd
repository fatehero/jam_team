extends Node




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet=preload('res://scenes/Bullet.tscn')
var player:KinematicBody2D
var my_ships=[]
var enemy_ships=[]
var l_half
var r_half
var halfs:Dictionary
var r_selected=0
var l_selected=1
var field
signal take_dmg
var r_hp=0
var l_hp=0
# Called when the node enters the scene tree for the first time.

func _ready():
	for i in range(2):
		my_ships.append(load("res://ship_types_resource/ship_type"+str(i)+".tres").duplicate())
	for i in range(2):
		enemy_ships.append(load("res://ship_types_resource/ship_type"+str(i)+".tres").duplicate())
