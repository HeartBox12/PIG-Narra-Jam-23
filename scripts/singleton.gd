extends Node

var destId = 0 #Used to track player position between scenes.
var FMODInstance

func _ready():
	
	FMODInstance = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.MUSIC_MUSIC).create_instance()
	FMODInstance.start()
	FMODInstance.release() #Move to the exit sequence
