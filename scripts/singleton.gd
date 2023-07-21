extends Node

var destId = 0 #Used to track player position between scenes.
var FMODInstance

func _enter_tree():
	RuntimeManager.play_one_shot_path("event:/Music/Music")
