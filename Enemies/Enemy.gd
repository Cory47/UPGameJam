extends StaticBody

var health = 100
var aggro = false

signal karma
signal shoot_bullet

export (PackedScene) var BulletScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play("default")
	var player = get_node("Player")
	#player.connect("karma", self, "_on_Enemy2_karma")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#makes sprite face player
	var player_pos = get_player_pos()
	look_at(player_pos, Vector3.UP)
	
	#standy/aggro behavior
	if(aggro == false):
		idle_behavior()
	else:
		aggro_behavior()
		
	
		
	if health < 0:
		die()

#placeholders for base class right now
func idle_behavior():
	pass
	
func aggro_behavior():
	pass
	
func die():
	emit_signal("karma")
	queue_free()
	
#gets adjusted player position to rotate enemy sprite, ignores up/down rotation
func get_player_pos():
	var player = $".".get_parent().get_node_or_null("Player") #.global_transform.origin
	var player_pos = Vector3.ZERO
	
	if(player != null):
		player_pos = player.global_transform.origin
	var adjusted_pos = Vector3(player_pos.x, $".".global_transform.origin.y, player_pos.z)
	
	return adjusted_pos

#determines enemy behavior when player is nearby
func _on_AggroRange_body_entered(body):
	if(body.is_in_group("Player")):
		aggro = true
		print("player entered aggro range")
func _on_AggroRange_body_exited(body):
	if(body.is_in_group("Player")):
		aggro = false
		print("player exited aggro range")


func _on_ShotTimer_timeout():
	var bullet = BulletScene.instance()
	add_child(bullet)
	bullet.translate()
	
#	var dest = get_player_pos()
#	print(dest)
#	bullet.setDest(dest)
	#bullet.translation = move_toward()
