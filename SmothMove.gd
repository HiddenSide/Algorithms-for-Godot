extends KinematicBody2D

const ACCELERATION = 100
const MAX_SPEED = 180
const FRICTION = 100

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	var inputvector = Vector2.ZERO
	inputvector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputvector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputvector = inputvector.normalized()
	

	if inputvector != Vector2.ZERO:
		velocity = velocity.move_toward(inputvector * MAX_SPEED,  ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_collide(velocity * delta)
