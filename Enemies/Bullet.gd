extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dest = Vector3()
var exist = true

func setDest(destination):
	dest = destination
func setExist(state):
	exist = state
# Called when the node enters the scene tree for the first time.
func _process(delta):
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
