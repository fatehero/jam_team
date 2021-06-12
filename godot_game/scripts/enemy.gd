extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var close=700
var too_close=100
var distance=0.0
var spd=100
var dir=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	distance=global_position.distance_to(glo.player.global_position)
	if distance<close:
		look_at(glo.player.global_position)
		shot()
		if distance>too_close:
			dir=global_position.direction_to(glo.player.global_position)
			move_and_slide(dir*spd)
		
		


func shot():
	pass
