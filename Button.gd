extends Button


func _ready():
	pass


func _on_Button_pressed():

	#emit_signal("start_game")
	get_tree().change_scene("res://Levels/Main/Cory_Main.tscn")



func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Main/Cory_Main.tscn")
	pass # Replace with function body.
