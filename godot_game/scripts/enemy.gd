extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var close=600
var too_close=150
var distance=0.0
var spd=150
var dir=Vector2.ZERO
var info
var latency=0
var hp setget set_hp
onready var anime=$anime



func set_hp(val):
	hp=val
	if hp<=0:
		glo.score+=5
		queue_free()

onready var forward = $Forward
onready var img = $img
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var rnd=round(rand_range(0,glo.enemy_ships.size()-1))
	
	info=glo.enemy_ships[rnd]
	
	for i in info.colors.size():
		
		img.material.set_shader_param("replace_"+str(i), info.colors[i])
	spd+=info.speed
	hp=info.helth


	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
		distance=global_position.distance_to(glo.player.global_position)
	
#	if distance<close:
		look_at(glo.player.global_position)
		shot()
		img.animation="idle"
#		ray.cast_to.y=spd+40
#		ray.force_raycast_update()
#		if ray_detect(ray):
#			randomize()
#			var i=round(rand_range(2,3))
#			var dir_ray=get_node("ray"+str(i))
#			print("colideng")

		if distance>too_close:
				img.animation="move"
				if  !$engine.playing:
					$engine.play()
				dir=global_position.direction_to(glo.player.global_position)
				move_and_slide(dir.normalized()*spd)
		
		


func shot():
	pass
	if latency<=0:
		var new_bullet:KinematicBody2D=glo.bullet.instance()
		for i in ['dmg','spd','pierce',"shape","sound"]:
			new_bullet[i]=info['bullet_'+i]
		new_bullet.colors=info["colors"]	
		new_bullet.global_position=	forward.global_position
		new_bullet.global_rotation_degrees=global_rotation_degrees+90
		new_bullet.shooter=self
		glo.field.add_child(new_bullet)
		latency=info.latency
		

func ray_detect(ra):
	ra.cast_to.y=spd+40
	ra.force_raycast_update()
	if ra.is_colliding():
		return true
	return false	
func _on_Timer_timeout():
	latency-=0.1


func _on_hitbox_body_entered(body):
	
	if "dmg" in body:
		if body.belong_to!="enemy":
			
			self.hp-=body.dmg
			
			anime.play("hit")
		if body.shooter!=self:
			body.pierce-=1	
			if body.pierce<0:
					
					body.queue_free()	



