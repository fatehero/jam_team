extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var prop="helth"
var side

# Called when the node enters the scene tree for the first time.
func _ready():
	glo.connect("reset_type",self,"reset")
	side=get_parent().get_parent().side
	$text.text=prop
	value=glo.my_ships[glo[side+"_selected"]][prop]
	

func reset():
	
	value=glo.my_ships[glo[side+"_selected"]][prop]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
