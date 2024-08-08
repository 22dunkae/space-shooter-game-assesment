extends Control
signal START




func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://sences/node_2d.tscn")
	START.emit()


func _on_button_pressed():
	get_tree().quit()
