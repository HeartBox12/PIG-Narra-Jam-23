extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

#Standard input detection.
#NOTE: does not allow for joystick analog inputs.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
