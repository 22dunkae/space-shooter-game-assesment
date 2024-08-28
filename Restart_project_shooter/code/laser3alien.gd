extends Area2D
class_name alienlaser3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y +=4


func _on_area_entered(area):
	
	if area is alienplayer or area is spaceinvaderlaser2:
		queue_free()# Replace with function body.


func _on_timer_timeout():
	queue_free()
