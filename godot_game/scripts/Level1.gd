extends Node2D

export var enemy_scene : PackedScene

var timer = Timer.new()

func _ready():
	randomize()
	timer.one_shot = false
	timer.wait_time = 10
	timer.connect("timeout", self, "spawn_enemy")
	add_child(timer)
	timer.start()

func spawn_enemy():
	var enemy = enemy_scene.instance()
	add_child(enemy)
	var spawn = get_node("Spawns" + "/" + "Spawn" + str(randi() % 4 + 1))
	enemy.global_position = Vector2(spawn.global_position)
