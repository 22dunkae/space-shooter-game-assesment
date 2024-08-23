extends Area2D
@onready var laser_perfab =preload("res://prefabs/laser.tscn")
@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
signal player_killed
var counter = 0
signal player_live_lost
var power_up_q_avaliable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#player movement
	if Input.is_action_pressed("player_down") and position.y <600:
		position.y += 8
	if Input.is_action_pressed("player_up") and  position.y >50:
		position.y -=8
	
	if Input.is_action_pressed("player_f") and position.x <1125:
		position.x+=8
	if Input.is_action_pressed("player_b") and position.x >50:
		position.x -=8	
	if power_up_q_avaliable == true:
		counter = 0
		if Input.is_action_just_pressed("power_up_q"):
			if counter == 4:
				power_up_q_avaliable = false
			if counter == 2:
				var laser = laser_perfab.instantiate()
				laser.position.y = -5
				laser.position.x = position
				get_parent().add_child(laser)
				$AudioStreamPlayer.play()
			if counter == 2:
				var laser = laser_perfab.instantiate()
				laser.position.y = +5
				laser.position.x = position
				get_parent().add_child(laser)
				$AudioStreamPlayer.play()
			while counter != 4:
				var laser = laser_perfab.instantiate()
				laser.position = position
				get_parent().add_child(laser)
				$AudioStreamPlayer.play()
				counter = counter + 1
				
		
	
		
		
	#laser shooting
	if Input.is_action_just_pressed("player_shoot"):	
		#make a laser
		var laser = laser_perfab.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()


func _on_area_entered(area):
	if area is opp_laser_glock:
		var death = explosion_prefab.instantiate()
		death.position = position
		get_parent().add_child(death)
		
		player_live_lost.emit()
	if area is opp:
		var death = explosion_prefab.instantiate()
		death.position = position
		get_parent().add_child(death)
		player_live_lost.emit()
		
	

	


func _on_area_2d_life_end():
	player_killed.emit()
	var death = explosion_prefab.instantiate()
	death.position = position
	get_parent().add_child(death)
	queue_free()
	
