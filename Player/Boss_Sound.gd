extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audioStream: AudioStream = preload("res://Sounds/slappyboss.mp3")
	self.set_stream(audioStream)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
