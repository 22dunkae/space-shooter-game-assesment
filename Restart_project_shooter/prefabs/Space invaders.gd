extends Node2D
var counter = 0
var x = 60
var counter2 = 0
var spawncount = 0
@onready var Alienenemy= preload("res://prefabs/space_invader_alien.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	Alienenemy.connect("enemy_dead","point" )




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter >= 8:
		counter = 0
		x = 60
	while counter2 == 0: 
		spawncount = randf_range(4,8)
		$Timer.start(spawncount)
		counter2+=1

func _on_timer_timeout():
	
	while counter <=8:
		var enemy = Alienenemy.instantiate()
		enemy.position = Vector2(x,80)
		get_parent().add_child(enemy)
		counter = counter +1
		x= x+120
		counter2 =0
		
