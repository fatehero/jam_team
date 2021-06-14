extends KinematicBody2D

export var bullet_scene : PackedScene

onready var forward = $Forward
onready var anim_left = $left_half/img
onready var anim_right =$right_half/img

var motion : Vector2
var speed = 250
var rotation_speed = 200
var halfs=2 setget set_halfs


func set_halfs(val):
	
	halfs=val
	
	if halfs<=0:
		glo.enemys=0
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
			
			anim_left.animation = "idle"
		
			anim_right.animation = "idle"
			motion = Vector2.ZERO
		elif down:
			motion *= -speed
			anim_left.animation = "revers"
		
			anim_right.animation = "revers"
		else:
			motion *=speed
		
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
	if motion!=Vector2.ZERO :
		if  !$engine.playing:
			$engine.play()
	else:
		$engine.stop()	
	motion = move_and_slide(motion)
