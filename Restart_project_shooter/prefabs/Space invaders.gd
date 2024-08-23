extends Node2D
class_name SpaceInvadersScene
var counter = 0
var x = 80
var counter2 = 0
var spawncount = 0
var score = 0
signal player_down
signal start
@onready var Alienenemy= preload("res://prefabs/space_invader_alien.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter >= 8:
		counter = 0
		x = 80
	while counter2 == 0: 
		spawncount = randf_range(6,10)
		$Timer.start(spawncount)
		counter2+=1

func _on_timer_timeout():
	
	while counter <=8:
		var spaceinvaderalien = Alienenemy.instantiate()
		spaceinvaderalien.position = Vector2(x,80)
		spaceinvaderalien.enemy_dead.connect(on_enemy_dead)
	
		get_parent().add_child(spaceinvaderalien)
		counter = counter +1
		x= x+125
		counter2 =0
		

func on_enemy_dead():
	score += 1
	$Label.text="Score: " + str(score/2)
	

func _on_spaceinvaderplayer_player_live_lost():
	
	
	queue_free()
	
	
	get_tree().change_scene_to_file("res://prefabs/Main_Menu_space_invaders.tscn")
	player_down.emit()
	
	
	
	print("change da funky scene bro")

	
	
