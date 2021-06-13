extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	glo[side+"_panel"]=self


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
export var side="l"

func _on_r_btn_pressed():
	glo[side+"_selected"]+=1
	if glo[side+"_selected"]>glo.my_ships.size()-1:
		glo[side+"_selected"]=0
#	glo[side+"_half"].reset()
	glo.emit_signal("reset_type")


func _on_l_btn_pressed():
	glo[side+"_selected"]-=1
	print(glo[side+"_selected"])
	if glo[side+"_selected"]<0:
		glo[side+"_selected"]=glo.my_ships.size()-1
#	glo[side+"_half"].reset()	
	glo.emit_signal("reset_type")		
