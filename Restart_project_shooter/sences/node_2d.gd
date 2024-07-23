extends Node2D
@export var HIGH_SCORE = 0
var counter = 0
signal highscore
# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui():
	print(HIGH_SCORE)
	
	while counter < HIGH_SCORE:
		highscore.emit()
		counter+=1
		print("counter: "+ str(counter)) 
func _on_game_highscore():
	print(HIGH_SCORE)
	
	HIGH_SCORE =HIGH_SCORE + 1
	update_ui() # Replace with function body.


func _on_resart_game_timeout():
	counter = 0 # Replace with function body.
