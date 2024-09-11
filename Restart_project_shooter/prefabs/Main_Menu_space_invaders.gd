extends Control
signal START
var score = Global.high_score_invaders
func _ready():
	update_ui()
func _on_EXIT_pressed():
	
	get_tree().quit()
	#exits

func _on_START_pressed():
	get_tree().change_scene_to_file("res://prefabs/Space invaders.tscn")
	START.emit() 
func _process(delta):
	if Global.update_ui_menu == true:
		update_ui()
func update_ui():
	
		$highscore.visible = true
		$highscore.text="High Score: " + str(score/2)
