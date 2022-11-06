extends Button


func _ready():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	print(self)
	get_tree().change_scene("res://Levels/Main/Start.tscn")
	pass

func _on_Start_pressed():
	get_tree().change_scene("res://Levels/L_Main2.tscn")
	pass # Replace with function body.
