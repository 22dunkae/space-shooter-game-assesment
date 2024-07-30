extends Area2D
class_name spaceinvaderlaser
@export var speed=25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is sthe elapsed time since the previous frame.
func _process(delta):
	position.y -=speed
