extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#makes sprite face player
	var player_pos = get_player_pos()
	look_at(player_pos, Vector3.UP)

#gets adjusted player position to rotate enemy sprite, ignores up/down rotation
func get_player_pos():
	var player = $".".get_parent().get_node_or_null("Player") #.global_transform.origin
	var player_pos = Vector3.ZERO
	
	if(player != null):
		player_pos = player.global_transform.origin
	var adjusted_pos = Vector3(player_pos.x, $".".global_transform.origin.y, player_pos.z)
	
	return adjusted_pos

