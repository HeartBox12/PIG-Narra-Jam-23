extends Area3D

var openCall:Callable = Callable(self, "open_done")

var openInst
var closeInst



func _on_body_entered(body):
	pass
	
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("Detection") #Not detecting
	openInst = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.SOUNDS_DOOR_OPEN).create_instance()
	#variable definition from hell
	openInst.start()
	openInst.set_callback(openCall, FMODStudioModule.FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER)

func open_done():
	openInst.release()
	closeInst = FMODStudioModule.get_studio_system().get_event_by_id(FMODGuids.Events.SOUNDS_DOOR_CLOSE).create_instance()
	closeInst.start()
	closeInst.release()


	
