extends HSlider


func _ready():
	pass


func _on_HSlider_value_changed(value):
	$Label.text = str(value)
	glo.rotation_speed = value
