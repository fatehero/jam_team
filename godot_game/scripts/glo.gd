extends Node

var player : KinematicBody2D
var my_ships=[]

func _ready():
	for i in range(2):
		my_ships.append(load("res://ship_types_resource/ship_type"+str(i)+".tres").duplicate())
