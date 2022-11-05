extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ammo = 20
var karma = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$NumBullets.text = str(ammo)
	$Score.text = str(karma)
	pass


func _on_Player_change_ammo(new_ammo):
	ammo = new_ammo
	pass # Replace with function body.


func _on_Boss_karma(new_karma):
	karma = karma - new_karma
	pass # Replace with function body.
