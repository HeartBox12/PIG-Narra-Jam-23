extends Area3D

@export var dest:String
@export var destId:int #int matching the dest Id of the marker where the player will end up in the next room.

func _on_body_entered(_body):
	print("changing")
	Singleton.destId = destId
	get_tree().change_scene_to_file(dest)
