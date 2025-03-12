extends CharacterBody2D

var turn = randi() % 2

func _ready():
	
	var direction
	if turn == 0:
		direction = 250
		pass
	else:
		direction = -250
		pass

	set_velocity(Vector2(direction, randi_range(100,150)))
	pass

		

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal()) 
		if velocity.x < 700 and velocity.x > -700: 
			velocity *= 1.1
		else:
			velocity *= 1
	pass
