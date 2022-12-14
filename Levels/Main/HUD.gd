extends CanvasLayer

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var karma = 100
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
	karma -= 10
	$ScoreLabel.text = "Karma: " + str(karma)
	if karma < 20:
		$Emoji4.hide()
		$Emoji5.show()
	elif karma < 50:
		$Emoji3.hide()
		$Emoji4.show()
	elif karma < 90:
		$Emoji2.hide()
		$Emoji3.show()
	else:
		$Emoji1.hide()
		$Emoji2.show()
		

func update_ammo(new_ammo):
	ammo += new_ammo
	$NumBulletsLabel.text = "Ammo: " + str(ammo)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_health():
	health -= 10
	$HealthBar.value = health
	$HealthLabel.text = "Health: " + str(health)
	
	if health <= 0:
		get_tree().change_scene("res://Levels/Main/Lose.tscn")


func update_bosstext():
	var numkilled = (100 - karma) / 10
	if numkilled == 0:
		$BossText.text = "You! Thanks for not killing any of my friends :) \n But you still need to die!"
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		$BossText.hide()
	else:
		$BossText.text = "You! You killed " + str(numkilled) + " of my friends! \n Now it's your turn to die!"
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		$BossText.hide()
	pass
