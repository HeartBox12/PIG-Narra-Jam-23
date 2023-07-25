extends Sprite3D

var tweened = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_anything_pressed() && !tweened:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate", Color(1,1,1,0), 1)
		tween.tween_callback(allowPlayerMovement)
		tween.tween_callback(self.queue_free)
		tweened = true
		
func allowPlayerMovement():
	get_node("../../player").canMove = true
