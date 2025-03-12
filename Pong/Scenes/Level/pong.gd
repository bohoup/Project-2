extends Node2D

var speed = 300
var turn = randi() % 2

var bola: PackedScene = preload("res://Scenes/Level/ball.tscn")

var player_score = 0
var computer_score = 0
var current_ball: CharacterBody2D

@onready var pos_com = $Com.position.x

func _ready():
	awal()
	
	
func awal():
	var instance = bola.instantiate()
	current_ball = instance
	current_ball.position = $Marker2D.position
	add_child(current_ball)

		

func _physics_process(_delta):

	
	var arah
	if current_ball.position.y > $Com.position.y:
		arah = 1
	elif current_ball.position.y < $Com.position.y:
		arah = -1
	else:
		arah = 0

	$Com.velocity.y = arah * speed 
	if $Com.position.x != pos_com:
		$Com.position.x = pos_com
	$Com.move_and_slide()
	
	pass


func _on_computer_score_body_entered(body):
	computer_score += 1 
	$UI/Score/Com.text = str(computer_score)
	print("computer = " + str(computer_score))
	body.queue_free()
	awal()

func _on_player_score_body_entered(body):
	player_score += 1
	$UI/Score/Player.text = str(player_score)
	print("player = " + str(player_score))
	body.queue_free()
	awal()
