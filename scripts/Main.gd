extends Node3D

@export var FMODEvent:EventAsset

# Called when the node enters the scene tree for the first time.
func _ready():
	Singleton.FMODInstance = RuntimeManager.create_instance(FMODEvent)
	
	var dests = [$dest0, $dest1, $dest2]
	#$Player.position = dests[Singleton.destId].position
	#instance = RuntimeManager.create_instance(FMODEvent) #OLD


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
	pass
