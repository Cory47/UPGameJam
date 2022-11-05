extends CanvasLayer

signal start_game
var i = -200

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$HealthLabel.text = "Health: " + str(i)
	$HealthBar.value = i
	i = i + 1


func update_score(score):
	$ScoreLabel.text = str(score)
	

func update_ammo(ammo):
	$NumBulletsLabel.text = "Ammo: " + str(ammo)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealthBar_value_changed(new_value):
	i = i + 1
	$HealthBar.value = i
