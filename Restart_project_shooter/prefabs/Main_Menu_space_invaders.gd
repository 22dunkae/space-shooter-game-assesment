extends Control
signal START
func _ready():
	pass
func _on_EXIT_pressed():
	
	get_tree().quit()
	#exits

func _on_START_pressed():
	get_tree().change_scene_to_file("res://prefabs/Space invaders.tscn")
	START.emit() 
