extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var side="r"
var info

var latency=0
var hp setget set_hp
func set_hp(val):
	hp=val
	
	glo[side+"_hp"]=hp
	print(hp)
	glo.emit_signal("take_dmg")
	if hp<=0:
		glo.player["halfs"]-=1
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	print(glo.player)
	glo[side+"_half"]=self
	info=glo.my_ships[glo[side+"_selected"]]
	self.hp=info.helth+20



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(side+"_atk"):
		shoot()
func shoot():
	if latency<=0:
		var new_bullet:KinematicBody2D=glo.bullet.instance()
		for i in ['dmg','spd','pierce']:
			new_bullet[i]=info['bullet_'+i]
		new_bullet.global_position=	glo.player.forward.global_position
		new_bullet.global_rotation=global_rotation
		new_bullet.belong_to="player"
		glo.field.add_child(new_bullet)
		latency=info.latency
	


func _on_right_half_body_entered(body):
	if 'dmg' in body:
		if body.belong_to=="enemy":
			print("yes")
			self.hp-=body.dmg
			body.queue_free()


func _on_Timer_timeout():
	latency-=0.1
