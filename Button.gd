extends Button


func _ready():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():

	#emit_signal("start_game")
	get_tree().change_scene("res://Levels/Main/Cory_Main.tscn")



func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Main/L_Main.tscn")
	pass # Replace with function body.
