extends Area3D

@export var dest:PackedScene


func _on_body_entered(body):
	print("Transing")
	get_tree().change_scene_to_packed(dest)
