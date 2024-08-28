extends Node2D
class_name alienplayer
@onready var laser_perfab =preload("res://prefabs/laser2.tscn")
const SPEED = 40.0
const JUMP_VELOCITY = -400.0
@onready var explosion_prefab = preload("res://prefabs/explosion.tscn")
@onready var killswitchprefab = preload("res://prefabs/spaceinvaders_kill_scene.tscn")
@onready var laserend = preload("res://prefabs/laserend.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
signal player_live_lost


func _physics_process(delta):
	# Add the gravity.
	

	# Handle Jump.
	
	
	
	if Input.is_action_pressed("player_f") and position.x <1120:
		position.x+=10
	if Input.is_action_pressed("player_b") and position.x >48:
		position.x -=10	
	if Input.is_action_just_pressed("player_shoot"):	
		#make a laser
		var laser = laser_perfab.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()
		
		


func _on_area_2d_area_entered(area):
	if area is alienlaser3:
		var laserended = laserend.instantiate()
		laserended.position = position
		get_parent().add_child(laserended)
		
		
		
		print("added")
		var death = explosion_prefab.instantiate()
		death.position = position
		get_parent().add_child(death)
		queue_free()
		player_live_lost.emit()	 # Replace with function body.
		
