extends StaticBody

var health = 2
var aggro = false
var velocity = Vector3.ZERO
var canMove = true

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
		idle_behavior(delta)
	else:
		aggro_behavior(delta)
	#print("test")
	#move towards player
	if ($RayCast.is_colliding() and $RayCast.get_collider() != null and $RayCast.get_collider().get_class() == "StaticBody"):
		pass
	else:
		transform.origin += velocity * delta
		
	if health < 0:
		die()

func idle_behavior(delta):
	velocity = Vector3.ZERO
	
func aggro_behavior(delta):
	velocity = -transform.basis.z * 5
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	
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
		$ShotTimer.start()
		print("player entered aggro range")
func _on_AggroRange_body_exited(body):
	if(body.is_in_group("Player")):
		aggro = false
		$ShotTimer.stop()
		print("player exited aggro range")

func _on_ShotTimer_timeout():
	print("enemy shooting")
	var bullet = BulletScene.instance()
	owner.add_child(bullet)
	bullet.transform = $ShotPosition.global_transform
	bullet.velocity = -bullet.transform.basis.z * bullet.muzzle_velocity
	bullet.scale = Vector3(0.25, 0.25, 0.25)

