extends "res://Enemies/Enemy.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play("mouse")
	$AggroRange/CollisionShape.scale = Vector3(5,5,5)
	$ShotTimer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin += velocity * delta

func idle_behavior(delta):
	velocity = Vector3.ZERO
	
func aggro_behavior(delta):
	$ShotTimer.stop()
	velocity = -transform.basis.z * 10
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
