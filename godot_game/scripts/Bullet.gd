extends KinematicBody2D
var dmg=10
var spd=200
var pierce=0   
var dir=0.0
var motion=0.0
var belong_to="enemy"
onready var forward=$forward
func _ready():
	pass
func _physics_process(delta):	
	motion = global_position.direction_to(forward.global_position)
	motion = motion.normalized() * spd
	move_and_slide(motion)
