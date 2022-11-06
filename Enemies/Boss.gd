extends StaticBody

var health = 10
var aggro = false
var karma = 1

signal karma

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


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
	
	queue_free()
	
#gets adjusted player position to rotate enemy sprite, ignores up/down rotation
func get_player_pos():
	var player_pos = $".".get_parent().get_node_or_null("Player").global_transform.origin
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


func _on_Enemy_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	pass # Replace with function body.


func _on_Enemy2_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy6_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy5_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy7_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy8_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy9_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy3_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy4_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.


func _on_Enemy11_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.1
	scale.y = scale.y * 1.1
	scale.z = scale.z * 1.1
	pass # Replace with function body.
