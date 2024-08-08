extends Control
signal START
func _on_EXIT_pressed():
    
    get_tree().quit()
    #exits

func _on_START_pressed():
    get_tree().change_scene_to_file("res://sences/node_2d.tscn")
    START.emit() 
