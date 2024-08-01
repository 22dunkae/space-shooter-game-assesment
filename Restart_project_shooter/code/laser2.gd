extends Area2D
class_name spaceinvaderlaser
@export var speed=25
@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is sthe elapsed time since the previous frame.
func _process(delta):
	
	position.y -=speed





func _on_area_entered(area):
	queue_free()
	if area is spaceinvaderalien or area is spaceinvaderalienarea:
		queue_free()
		print("laser")# Replace with function body.


func _on_timer_timeout():
	queue_free() # Replace with function body.
