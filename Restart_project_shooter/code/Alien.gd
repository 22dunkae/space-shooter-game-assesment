extends CharacterBody2D
class_name spaceinvaderalien

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var move_speed = 10


func _physics_process(delta):
	var collionion = move_and_collide(Vector2.DOWN * delta * move_speed)
	
func kill():
	
	queue_free()

@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
func _on_area_2d_area_entered(area):
	if area is spaceinvaderlaser:
		var death = explosion_prefab.instantiate()
		death.position = position
		get_parent().add_child(death)
		kill() # Replace with function body.
