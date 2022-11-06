extends Spatial

signal shot_taken
signal removeWall

export(NodePath) var cam_path := NodePath("Camera")
onready var cam: Camera = get_node(cam_path)

export var mouse_sensitivity := 2.0
export var y_limit := 90.0
var mouse_axis := Vector2()
var rot := Vector3()


var held_object: Object
export (PackedScene) var bullet_scene

#gun variables
var damage = 10
var ammo = 20
var change_speed = 0
signal change_speed
onready var anim_player = $Camera/HUD/AnimatedSprite
onready var raycast = $Camera/RayCast

var time = 0
var fire_enabled = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_sensitivity = mouse_sensitivity / 1000
	y_limit = deg2rad(y_limit)
	
	
func fire():
	if Input.is_action_pressed("ui_shoot") and ammo > 0:
		#runs once per fire animation
		ammo -= 1
		$Camera/HUD.update_ammo(-1)
		print(ammo, " ammo left")
	
		#increases the players speed every 20 shots
		if change_speed > 19:
			emit_signal("change_speed")
			change_speed = 0
		else:
			change_speed += 1
		
			#gets the object colliding and decreases health if enemy
		if $Camera/RayCast.is_colliding():
			var target = raycast.get_collider()
			if target.is_in_group("Enemy"):
				target.health -= damage
		
		anim_player.play("Firing")
	else:
		anim_player.play("Idle")


# Called when there is an input event
func _input(event: InputEvent) -> void:
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		mouse_axis = event.relative
		camera_rotation()
		
	#if InputEventMouseButton and event.is_pressed() and Input.is_action_just_pressed("ui_shoot"):
		


func camera_rotation() -> void:
	# Horizontal mouse look.
	rot.y -= mouse_axis.x * mouse_sensitivity
	# Vertical mouse look.
	rot.x = clamp(rot.x - mouse_axis.y * mouse_sensitivity, -y_limit, y_limit)
	
	get_owner().rotation.y = rot.y
	rotation.x = rot.x
	
	
func _physics_process(delta):
	time += delta
	if (fire_enabled == true):
		fire_enabled = false
		time = 0
		fire()
	if (time > 0.5):
		fire_enabled = true
	if Input.is_action_pressed("ui_shoot"):
		if $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_class() == "StaticBody" and $Camera/RayCast.get_collider().get_name() == "WallStaticBody":
				held_object =  $Camera/RayCast.get_collider()
				held_object.collision_mask = 0
				held_object.free()
				emit_signal("removeWall")
				print(held_object)
	pass
			
			
