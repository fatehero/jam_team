extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var side="r"

var info
onready var img=$img
onready var coll=$coll
onready var anime=$anime
var latency=0
var died=false
var hp setget set_hp
func set_hp(val):
	hp=val
	
	glo[side+"_hp"]=hp
	print(hp)
	glo.emit_signal("take_dmg")
	if hp<=0 and!died:
		glo.player["halfs"]-=1
		visible=false
		died=true
		coll.queue_free()
		pause_mode=Node.PAUSE_MODE_STOP
# Called when the node enters the scene tree for the first time.
func _ready():
	
	glo[side+"_half"]=self
	info=glo.my_ships[glo[side+"_selected"]]
	for i in info.colors.size():
		print(info.colors[i])
		img.material.set_shader_param("replace_"+str(i), info.colors[i])
	
	self.hp=info.helth+20



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(side+"_atk")and!died:
		shoot()
func shoot():
	if latency<=0:
		var new_bullet:KinematicBody2D=glo.bullet.instance()
		for i in ['dmg','spd','pierce',"shape"]:
			new_bullet[i]=info['bullet_'+i]
		new_bullet.global_position=	glo.player.forward.global_position
		new_bullet.global_rotation=global_rotation
		new_bullet.belong_to="player"
		glo.field.add_child(new_bullet)
		latency=info.latency
	


func _on_right_half_body_entered(body):
	if 'dmg' in body:
		if body.belong_to=="enemy":
			
			self.hp-=body.dmg
			anime.play("hit")
			body.queue_free()


func _on_Timer_timeout():
	latency-=0.1
