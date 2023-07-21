extends Node

var destId = 0 #Used to track player position between scenes.
var FMODInstance

func _ready():
	
	RuntimeManager.play_one_shot_id(FMODGuids.Events.MUSIC_MUSIC)
