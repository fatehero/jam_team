extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var prop="descrption"
var side

# Called when the node enters the scene tree for the first time.
func _ready():
	glo.connect("reset_type",self,"reset")
	side=get_parent().get_parent().side
	
	text=glo.my_ships[glo[side+"_selected"]][prop]


func reset():
	
	text=glo.my_ships[glo[side+"_selected"]][prop]
	
