extends CharacterBody2D

@onready var laser_perfab =preload("res://prefabs/laser2.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	# Add the gravity.
	

	# Handle Jump.
	
	
	
	if Input.is_action_pressed("player_f") and position.x <1020:
		position.x+=10
	if Input.is_action_pressed("player_b") and position.x >0:
		position.x -=10	
	if Input.is_action_just_pressed("player_shoot"):	
		#make a laser
		var laser = laser_perfab.instantiate()
		laser.position = Vector2(position.x,-20)
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()
		
