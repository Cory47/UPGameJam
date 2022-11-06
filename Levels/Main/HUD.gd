extends CanvasLayer

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var karma = 20
var ammo = 20
var health = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.value = health
	pass # Replace with function body.

func _process(delta):
	pass
#	$HealthLabel.text = "Health: " + str(i)
#	$HealthBar.value = i
#	i = i + 1


func update_score(score):
	karma -= 1
	$ScoreLabel.text = "Karma: " + str(karma)
	

func update_ammo(new_ammo):
	ammo += new_ammo
	$NumBulletsLabel.text = "Ammo: " + str(ammo)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_health():
	health -= 10
	$HealthBar.value = health
	$HealthLabel.text = str(health)



