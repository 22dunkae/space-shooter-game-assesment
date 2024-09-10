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
@onready var killswitchprefab = preload("res://prefabs/spaceinvaders_kill_scene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.on_dead = false
	score =0
	$Label.text="Score: " + str(score/2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score == 25:
		get_tree().change_scene_to_file("res://prefabs/Main_Menu.tscn")
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
	var killenemy = killswitchprefab.instantiate()
	killenemy.position = position
	get_parent().add_child(killenemy)
	
	
	Alienenemy.emit_signal("start")
	queue_free()
	player_down.emit()

	get_tree().change_scene_to_file("res://prefabs/Main_Menu_space_invaders.tscn")
	start.emit()
	print("change da funky scene bro")
	
	
func _on_control_start():
	$CharacterBody2D/Timer.start()
	score = 0
	get_tree().unload_current_scene()
	get_tree().change_scene_to_file("res://prefabs/Space invaders.tscn") # Replace with function body.
