extends Area3D

var openCall:Callable = Callable(self, "open_done")

var openInst
var closeInst

func _on_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	print("Detection") #Not detecting
	get_node("../../player").canMove = false #The player should "look gone"
	get_node("../../player").visible = false
	openInst = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.SOUNDS_DOOR_OPEN).create_instance()
	#variable definition from hell
	openInst.start()
	openInst.set_callback(openCall, FMODStudioModule.FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER)
	
	$"/root/RuntimeManager".start() #close the game after 10s

func open_done():
	openInst.release()
	closeInst = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.SOUNDS_DOOR_CLOSE).create_instance()
	#closeInst.start()
	#closeInst.release()


func _on_timeout():
	get_tree().quit()
