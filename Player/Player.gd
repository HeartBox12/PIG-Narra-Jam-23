extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75

@onready var animation_player = get_node("AnimatedSprite3D")
@onready var origin = get_node("../Origin")
@onready var bubble = $Bubble

var target_velocity = Vector3.ZERO
var fall_timer = 0
var current_animation = "idle"
var a = 0
var canMove = false

func _ready():
	if Singleton.FMODInstance != null:
		Singleton.FMODInstnace.stop(FMODStudioModule.FMOD_STUDIO_STOP_IMMEDIATE)
	animation_player.play()
	Singleton.FMODInstance = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.MUSIC_MUSIC).create_instance()
	Singleton.FMODInstance.start()

func _physics_process(delta):
	if canMove && Dialogic.current_timeline == null:
		
		if (Dialogic.current_timeline == null && canMove == true):
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
			
			if input_dir.length() != 0:
				$NPCDetector.look_at(position - target_velocity, Vector3.UP)#pivot the detector to face as player does.
				
			velocity = target_velocity
			move_and_slide()
		
		if Input.is_action_just_pressed("ui_accept") && $NPCDetector.get_collision_count() != 0:
				var speaker = $NPCDetector.get_collider(0)
				FMODStudioModule.get_studio_system().set_parameter_by_name("character", 2, false)
				Dialogic.start(speaker.timeline) # Reference target's timeline
		
		animation_player.animation = current_animation + str(a) #FOR LATER
		
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		fall_timer += 1
		if fall_timer >= 60:
			global_position = origin.position
			fall_timer = 0
			target_velocity.y = 0
		
			
	if $NPCDetector.get_collision_count() != 0:
		bubble.visible = true
		bubble.play()
	else:
		bubble.visible = false
		bubble.animation = "appear"
		bubble.stop()


func _on_frame_changed():
	if ($AnimatedSprite3D.frame == 3 || $AnimatedSprite3D.frame == 7) && canMove:
		RuntimeManager.play_one_shot_id(FMODGuids.Events.SOUNDS_FOOTSTEP)


func _on_bubble_animation_finished():
	bubble.animation = "loop"
