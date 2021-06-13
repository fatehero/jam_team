extends KinematicBody2D
var dmg=10
var spd=200
var pierce=0   
var dir=0.0
var motion=0.0
var shooter
var shape=1
var colors
var belong_to="enemy"
onready var forward=$forward
onready var img=$Sprite
func _ready():
	pass
func _physics_process(delta):
	img.animation="shot"+str(shape
	)	
	motion = global_position.direction_to(forward.global_position)
	motion = motion.normalized() * spd
	move_and_slide(motion)


func _on_Timer_timeout():
	queue_free()
