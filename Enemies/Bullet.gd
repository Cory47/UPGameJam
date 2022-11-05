extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dest = Vector3()
var exist = true
var velocity = Vector3.ZERO
export var g = Vector3.DOWN
export var muzzle_velocity = 25

func setDest(destination):
	dest = destination
func setExist(state):
	exist = state
# Called when the node enters the scene tree for the first time.
func _process(delta):
	velocity += g * delta
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta

