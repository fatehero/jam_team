extends Node

var player : KinematicBody2D
var my_ships=[]

func _ready():
	for i in range(3):
		my_ships.append(load("res://ship_types_resource/ship_type%"%i+".tres").duplicate())
