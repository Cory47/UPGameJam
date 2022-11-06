extends Button


func _ready():
	pass


func _on_Button_pressed():
	#emit_signal("start_game")
	get_tree().change_scene("res://Levels/Main/L_Main.tscn")

