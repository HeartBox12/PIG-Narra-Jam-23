extends Node3D

@export var FMODEvent:EventAsset
var instance:EventInstance
# Called when the node enters the scene tree for the first time.
func _ready():
	instance = RuntimeManager.create_instance(FMODEvent)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		instance.set_parameter_by_name("Sadness", 1, false)
		instance.start()
		instance.release()
		print("Meant to be playing")
