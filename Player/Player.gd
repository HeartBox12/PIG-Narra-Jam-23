extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75

@onready var animation_player = get_node("AnimatedSprite3D")
@onready var origin = get_node("/root/Main/Origin")

var target_velocity = Vector3.ZERO
var fall_timer = 0
var current_animation = "idle"
var a = 0

func _physics_process(delta):
	
#	var direction = Vector3.ZERO
#	animation_player.play()
#
##Standard input detection.
##NOTE: does not allow for joystick analog inputs.
##---------------------------------------------------------
#	if Input.is_action_pressed("move_right"):
#		direction.x += 1
#		animation_player.flip_h = false
#		animation_player.animation = "moving"
#	if Input.is_action_just_released("move_right"):
#		animation_player.animation = "standing"
##---------------------------------------------------------
#	if Input.is_action_pressed("move_left"):
#		direction.x -= 1
#		animation_player.flip_h = true
#		animation_player.animation = "moving"
#	if Input.is_action_just_released("move_left"):
#		animation_player.animation = "standing"
##---------------------------------------------------------
#	if Input.is_action_pressed("move_down"):
#		direction.z += 1
#		animation_player.animation = "moving"
#	if Input.is_action_just_released("move_down"):
#		animation_player.animation = "standing"
##---------------------------------------------------------
#	if Input.is_action_pressed("move_up"):
#		direction.z -= 1
#		animation_player.animation = "moving"
#	if Input.is_action_just_released("move_up"):
#		animation_player.animation = "standing"
##---------------------------------------------------------
#
#	#RIGHT HERE
#
#	if direction != Vector3.ZERO:
#		direction = direction.normalized()
#		$Pivot.look_at(position + direction, Vector3.UP)
#
#	target_velocity.x = direction.x * speed
#	target_velocity.z = direction.z * speed
#
#	if not is_on_floor():
#		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
#		fall_timer += 1
#		if fall_timer >= 60:
#			global_position = origin.position
#			fall_timer = 0
#			target_velocity.y = 0
#
#	velocity = target_velocity
#	move_and_slide()
#
	
	#The old movement code is commented out above just in case things break somehow
	
	animation_player.play()
	current_animation = "idle"
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_down"):
		input_dir.y += 1
	if Input.is_action_pressed("move_up"):
		input_dir.y -= 1
	input_dir = input_dir.normalized()
	if input_dir.length() != 0:
		a = input_dir.angle() / (PI/4)
		a = wrapi(int(a), 0, 8)
		current_animation = "move"
	target_velocity.x = input_dir.x * speed
	target_velocity.z = input_dir.y * speed
	velocity = target_velocity
	move_and_slide()
	
	animation_player.animation = current_animation + str(a)
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		fall_timer += 1
		if fall_timer >= 60:
			global_position = origin.position
			fall_timer = 0
			target_velocity.y = 0
	
	if Input.is_action_just_pressed("ui_accept"):
		if $Pivot/NPCDetector.get_collision_count() != 0:
			pass
			#Dialogic.start($Pivot/NPCDetector.get_collider(0).get_parent().timeline) # Reference target's timeline
