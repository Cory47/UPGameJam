extends "res://Enemies/Enemy.gd"
var velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play("mouse")
	$ShotTimer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin += velocity * delta

func idle_behavior(delta):
	velocity = Vector3.ZERO
	
func aggro_behavior(delta):
	$ShotTimer.stop()
	velocity = -transform.basis.z * 15
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
