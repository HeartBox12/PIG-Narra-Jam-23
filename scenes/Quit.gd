extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.is_hovered():
		self_modulate.v = .9
	else:
		self_modulate.v = 1
	
func _pressed():
	get_tree().quit()
