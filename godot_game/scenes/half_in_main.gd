extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var side="r"
var info
onready var img=$img
# Called when the node enters the scene tree for the first time.
func _ready():
	glo.connect("reset_type",self,"reset")
	glo[side+"_half"]=self
	
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reset():
	
	info=glo.my_ships[glo[side+"_selected"]]
	for i in info.colors.size():
		
		img.material.set_shader_param("replace_"+str(i), info.colors[i])


func _on_ready_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")
