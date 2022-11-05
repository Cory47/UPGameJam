extends StaticBody

var health = 100
var aggro = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#makes sprite face player
	var player_pos = get_player_pos()
	look_at(player_pos, Vector3.UP)
	
	#standy/aggro behavior
	#if(aggro == false):
		#nothing special right now
	#else:
		#move towards player_pos
	
	
#gets adjusted player position to rotate enemy sprite, ignores up/down rotation
func get_player_pos():
	var player_pos = $".".get_parent().get_node_or_null("Player").global_transform.origin
	var adjusted_pos = Vector3(player_pos.x, $".".global_transform.origin.y, player_pos.z)
	
	return adjusted_pos

#determines enemy behavior when player is nearby
func _on_AggroRange_area_entered(area):
	#if area is player collision area, then enter attack mode
	pass
func _on_AggroRange_area_exited(area):
	#if area exiting is player's, then go back to standby
	pass # Replace with function body.
