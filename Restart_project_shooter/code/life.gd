extends Area2D
var lives = 3
signal life_end
signal life_2
signal life_1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lives == 0:
		life_end.emit()	
		
	if lives == 2:
		life_2.emit()	
		
	if lives == 1:
		life_1.emit()	
		


func _on_area_entered(area):
	
	if area is opp:
		lives=lives-1
		



func _on_player_player_live_lost():
	lives=lives-1 
