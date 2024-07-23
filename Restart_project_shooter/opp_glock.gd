extends Area2D
class_name opp_laser_glock


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5


func _on_area_entered(area):
	if area is laser:
		queue_free() # Replace with function body.
