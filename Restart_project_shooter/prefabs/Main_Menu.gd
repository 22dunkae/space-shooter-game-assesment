extends Control
@export var HIGH_SCORE = 0
@export var TOTAL_HIGH_SCORE = 0
signal START
# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_START_pressed():
	print("score" + str(HIGH_SCORE))
	get_tree().quit()
	#exits

func _on_EXIT_pressed():
	get_tree().change_scene_to_file("res://sences/base_game.tscn")
	START.emit()
	#starts
func update_ui():
	$score.text = "Score: " + str(HIGH_SCORE) 
	$Label.text = "w" +str(HIGH_SCORE)
	print("ui updated")

func _on_game_highscore():
	print(HIGH_SCORE)
	
	HIGH_SCORE =HIGH_SCORE + 1
	update_ui()
	pass

func _on_resart_game_timeout():
	update_ui()
	$score.text= "Score: " + str(HIGH_SCORE)


func _on_node_2d_highscore():
	print(HIGH_SCORE)
	
	HIGH_SCORE =HIGH_SCORE + 1
	update_ui() # Replace with function body.
