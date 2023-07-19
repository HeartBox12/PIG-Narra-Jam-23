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
			print("playing")
			Dialogic.start($Pivot/NPCDetector.get_collider(0).get_parent().timeline) # Reference target's timeline
