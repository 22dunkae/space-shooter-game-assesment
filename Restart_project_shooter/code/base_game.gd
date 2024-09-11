extends Node2D
#in chrage of keeping score and spwaing in opps
var score=0
var lives=3
signal highscore
var counter = 0
var tutorial = false
@onready var opp_prefab= preload("res://prefabs/opp.tscn")
@onready var astroids= preload("res://prefabs/astroids.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()
	start_game()
	update_lives()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tutorial == true:
		get_tree().change_scene_to_file("res://sences/tutorial_completedl.tscn")
	if score >= 25:
		tutorial = true
		


func _on_opp_timer_timeout():
	var opp =opp_prefab.instantiate()
	var random_y= randi_range(35,597)
	opp.opp_down.connect(on_opp_killed)
	#set the positoin
	opp.position= Vector2(1100,random_y)
	add_child(opp)
func start_game():
	
	$game_ui/Label2.text="Lives: " + str(lives)
	$game_ui/Label.text="Score: " + str(score)
	
	
func update_ui():
	$game_ui/Label.text="Score: " + str(score)
	
func update_lives():
	$game_ui/Label2.text="Lives: " + str(lives)
func on_opp_killed():
	score+= 1
	update_ui()


func _on_player_player_killed():
	counter =0
	while counter < score:
		highscore.emit()
		counter+=1
		print("counter: "+ str(counter))
	$resart_game.start()
	

	


func _on_resart_game_timeout():
	get_tree().change_scene_to_file("res://prefabs/Main_Menu.tscn")


func _on_mainmenu_start():
	start_game()
	print(str(counter))
	# Replace with function body.


func _on_area_2d_life_2():
	lives = 2
	update_lives() # Replace with function body.


func _on_area_2d_life_1():
	lives = 1
	update_lives() # Replace with function body.


func _on_area_2d_life_end():
	lives = 0
	update_lives() # Replace with function body.


func _on_astroids_timout_timeout():
	var astroid = astroids.instantiate()
	var random_y= randi_range(35,597)
	
	#set the positoin
	astroid.position= Vector2(1100,random_y)
	add_child(astroid) # Replace with function body.
