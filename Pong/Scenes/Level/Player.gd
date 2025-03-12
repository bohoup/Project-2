extends CharacterBody2D

var speed = 300
var pos = position.x

func _physics_process(_delta):
	
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	if position.x != pos:
		position.x = pos

	move_and_slide()
