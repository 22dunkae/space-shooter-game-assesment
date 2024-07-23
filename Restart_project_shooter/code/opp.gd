extends Area2D
class_name opp

@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
@export var speed = 3
signal  opp_down
@onready var laser_prefab = preload("res://prefabs/opp_glock.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed



func _on_area_entered(area):
	if area is laser:	
		var explos
		var explosion = explosion_prefab.instantiate()
		explosion.position=position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		opp_down.emit()	
	


func _on_laser_spawn_timer_timeout():
	var laser = laser_prefab.instantiate()
	laser.position = position
	get_parent().add_child(laser)
