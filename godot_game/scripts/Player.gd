extends KinematicBody2D

export var bullet_scene : PackedScene

onready var forward = $Forward

var motion : Vector2
var speed = 300
var rotation_speed = 250
var halfs=2 setget set_halfs


func set_halfs(val):
	print("set_half")
	halfs=val
	if halfs<=0:
		get_tree().reload_current_scene()

func _ready():
	glo.player = self
	
	

func _physics_process(delta):
	motion = global_position.direction_to(forward.global_position)
	motion = motion.normalized() * speed
	if Input.is_action_pressed("up"):
		motion = move_and_slide(motion)
	if Input.is_action_pressed("down"):
		motion = move_and_slide(-motion)

func _process(delta):
	
	if Input.is_action_pressed("right"):
		rotation_degrees += rotation_speed * delta
	if Input.is_action_pressed("left"):
		rotation_degrees += -rotation_speed * delta
