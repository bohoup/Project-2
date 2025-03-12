extends Node2D

var obstacle: PackedScene = preload("res://obstacle.tscn")
var open = false
var foll

# function to restart
func restart():
	get_tree().reload_current_scene()

# instance obsctacle 
func instance_obs():
	var instance = obstacle.instantiate()
	instance.position = $Position.get_child(randi() % 8).position
	add_child(instance)
	var foll = instance 
	foll.z_index -= 1 # make it behind floor
	pass



func _ready():
	instance_obs() 
	pass
	
	
	
func _process(_delta):
	# instance after quee_free()
	if open:
		instance_obs()
		open = false
		
	$UI/Point.text = str(Global.score)






# queue_free() obstacle
func _on_area_2d_body_entered(body):
	body.queue_free()
	open = true

# button to restart
func _on_button_pressed():
	restart()
	Global.score = 0



