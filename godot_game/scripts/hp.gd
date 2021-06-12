extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var side="r"
onready var tween=$tween
var old_value
var new_value
# Called when the node enters the scene tree for the first time.
func _ready():
	glo.connect("take_dmg",self,"change_value")
	max_value=glo[side+"_hp"]
	value=max_value
	old_value=max_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_value():
	
		new_value=glo.get(side+"_hp")
		print(max_value)
		tween.interpolate_property(self,"value",old_value,new_value,1)
		tween.start()
		old_value=new_value
