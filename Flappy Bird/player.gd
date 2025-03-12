extends CharacterBody2D


var SPEED = 10
const JUMP_VELOCITY = -400.0
var grafity = true
var hit = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# if hit the wall or floor = make player cant jump
	if is_on_wall() or is_on_ceiling() or is_on_floor():
		hit = true
	
	
	
	# Add the gravity.
	if grafity:
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and not hit:
		velocity.y = JUMP_VELOCITY
		$Timer.start()
		grafity = false
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = 1
	#if direction:
		#velocity.x = direction * SPEED

	move_and_slide()

# make gravity active again after 0.5 second
func _on_timer_timeout():
	grafity = true
