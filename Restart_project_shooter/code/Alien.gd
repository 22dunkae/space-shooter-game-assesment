extends CharacterBody2D
class_name spaceinvaderalien
signal timerreset
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var shootingcount = randf_range(0,50)
# Get the gravity from the project settings to be synced with RigidBody nodes.
var move_speed = 10
var timerwait = false
var counter = 0

func _physics_process(delta):
	while counter == 0: 
		shootingcount = randf_range(0.3,1)
		$Timer.start(shootingcount)
		counter+=1
	
func kill():
	
	queue_free()

@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
func _on_area_2d_area_entered(area):
	if area is spaceinvaderlaser:
		var death = explosion_prefab.instantiate()
		death.position = position
		get_parent().add_child(death)
		kill() # Replace with function body.


func _on_timer_timeout():
	shootingcount = 0
	counter = 0
	shootingcount = randf_range(0.7,1.8)
	var bullet = preload("res://prefabs/laser3alien.tscn")
	var firedbullet = bullet.instantiate()
	firedbullet.position = position
	get_parent().add_child(firedbullet)
	
