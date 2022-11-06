extends CanvasLayer

signal start_game
var i = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var karma = 100
var ammo = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
#	$HealthLabel.text = "Health: " + str(i)
#	$HealthBar.value = i
#	i = i + 1


func update_score(score):
	karma -= 5
	$ScoreLabel.text = "Karma: " + str(karma)
	if karma == 95:
		$Emoji1.hide()
		$Emoji2.show()
	elif karma == 90:
		$Emoji2.hide()
		$Emoji3.show()
	elif karma == 85:
		$Emoji3.hide()
		$Emoji4.show()
	else:
		$Emoji4.hide()
		$Emoji5.show()

func update_ammo(new_ammo):
	ammo += new_ammo
	$NumBulletsLabel.text = "Ammo: " + str(ammo)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealthBar_value_changed(new_value):
	$HealthBar.value = i
