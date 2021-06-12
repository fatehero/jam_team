extends KinematicBody2D

export var bullet_scene : PackedScene

onready var forward = $Forward
onready var anim_left = $left_half/AnimatedSprite
onready var anim_right =$right_half/AnimatedSprite 

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
	anim_left.playing = true
	anim_right.playing = true

func _physics_process(delta):
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	if down or up:
		motion = global_position.direction_to(forward.global_position)
		motion = motion.normalized()
		if up and down:
			anim_left.animation = "idle"
			anim_right.animation = "idle"
			motion = Vector2.ZERO
		elif up:
			motion *= speed
		else:
			motion *= -speed
		anim_left.animation = "move"
		anim_right.animation = "move"
	else:
		anim_left.animation = "idle"
		anim_right.animation = "idle"
		motion = Vector2.ZERO
	if Input.is_action_pressed("right"):
		anim_left.animation = "move"
		rotation_degrees += rotation_speed * delta
	if Input.is_action_pressed("left"):
		anim_right.animation = "move"
		rotation_degrees += -rotation_speed * delta

	motion = move_and_slide(motion)
