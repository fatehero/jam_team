extends KinematicBody2D

export var bullet_scene : PackedScene

var motion : Vector2
var speed = 100
var rotation_speed = 250

func _physics_process(delta):
	motion *= speed
	motion = move_and_slide(motion)

func _process(delta):
	if Input.is_action_pressed("right"):
		rotation_degrees += rotation_speed * delta
	if Input.is_action_pressed("left"):
		rotation_degrees += -rotation_speed * delta
