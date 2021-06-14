extends Node2D

export var enemy_scene : PackedScene

var timer = Timer.new()
var max_enemys = 5
var enemys = 2

func _ready():
	glo.level=self
	randomize()
	timer.one_shot = false
	timer.wait_time = 10
	timer.connect("timeout", self, "spawn_enemy")
	add_child(timer)
	timer.start()

func spawn_enemy():
	if glo.enemys < glo.max_enemys:
		glo.enemys += 1
		var enemy = enemy_scene.instance()
		add_child(enemy)
		var spawn = get_node("Player/Spawns" + "/" + "Spawn" + str(randi() % 4 + 1))
		enemy.global_position = spawn.global_position
