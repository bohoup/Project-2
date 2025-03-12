extends CharacterBody2D

var speed = 300


# animation entrance
func _ready():
	$AnimationPlayer.play("up")
	pass


func _physics_process(_delta):
	
	# move to the left after deploy
	velocity.x = -1 * speed
	
	
	# stop moving and animation exit after hit player
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		speed = 0
		$AnimationPlayer.play_backwards("up")
	move_and_slide()


# change variable hit inside player
func _on_area_2d_body_entered(body):
	var hit
	
	if "hit" in body:
		hit = false
		Global.score += 1 
		
	

