extends Node3D

func _ready():
	var _dests = [$dest0, $dest1, $dest2]

func _process(_delta):
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
	pass
