extends KinematicBody2D

export var bullet_scene : PackedScene

onready var forward = $Forward
onready var anim_left = $left_half/img
onready var anim_right =$right_half/img

var motion : Vector2
var speed = 300
var rotation_speed = 200
var halfs=2 setget set_halfs


func set_halfs(val):
	print("set_half")
	halfs=val
	
	if halfs<=0:
		if glo.score>glo.high_score:
			glo.high_score=glo.score
			glo.emit_signal("scored_high")
		get_tree().change_scene("res://scenes/main.tscn")

func _ready():
	glo.player = self
	rotation_speed = glo.rotation_speed
	anim_left.playing = true
	anim_right.playing = true
	speed+=glo.r_half.info.speed
	speed+=glo.l_half.info.speed

func _physics_process(delta):
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	if down or up:
		motion = global_position.direction_to(forward.global_position)
		motion = motion.normalized()
		if up and down:
			if anim_left!=null:
				anim_left.animation = "idle"
			if anim_right!=null:
				anim_right.animation = "idle"
			motion = Vector2.ZERO
		elif up:
			motion *= speed
		else:
			motion *= -speed
		if anim_left!=null:	
			anim_left.animation = "move"
		if anim_right!=null:
			anim_right.animation = "move"
	else:
		if anim_left!=null:
		 anim_left.animation = "idle"
		if anim_right!=null:
			anim_right.animation = "idle"
		motion = Vector2.ZERO
	if Input.is_action_pressed("right"):
		if anim_left!=null: 
		 anim_left.animation = "move"
		rotation_degrees += rotation_speed * delta
	if Input.is_action_pressed("left"):
		if anim_right!=null:
		 anim_right.animation = "move"
		rotation_degrees += -rotation_speed * delta

	motion = move_and_slide(motion)
