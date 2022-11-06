extends "res://Enemies/Enemy.gd"

#var health = 10
#var aggro = false
var karma = 1
var shotTime = 10

#signal karma
#signal shoot_bullet

#export (PackedScene) var BulletScene

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 10
	$Sprite.play("Boss")
	$ShotTimer.wait_time = shotTime


#placeholders for base class right now
func idle_behavior(delta):
	pass
	
func aggro_behavior(delta):
	pass
	
func die():
	queue_free()
	
func _on_ShotTimer_timeout():
	print("enemy shooting")
	var bullet = BulletScene.instance()
	owner.add_child(bullet)
	bullet.transform = $ShotPosition.global_transform
	bullet.velocity = -bullet.transform.basis.z * 10
	bullet.scale = Vector3(0.25, 0.25, 0.25)

func _on_Enemy_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy2_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy6_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy5_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy7_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy8_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy9_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy3_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy4_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy11_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.


func _on_Enemy10_karma():
	print("add health")
	health += karma * 2
	scale.x = scale.x * 1.2
	scale.y = scale.y * 1.2
	scale.z = scale.z * 1.2
	$ShotTimer.wait_time = $ShotTimer.wait_time * 0.9
	pass # Replace with function body.
