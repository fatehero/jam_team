extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player:KinematicBody2D
var my_ships=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		my_ships.append(load("res://ship_types_resource/ship_type%"%i+".tres").duplicate())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
