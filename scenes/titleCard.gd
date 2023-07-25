extends Sprite3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_anything_pressed():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate", Color(1,1,1,0), 1)
		tween.tween_callback(allowPlayerMovement)
		tween.tween_callback(self.queue_free)
		
func allowPlayerMovement():
	get_node("../../player").canMove = true
