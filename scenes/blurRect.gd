extends ColorRect


@onready var blur = $Blur
@export var blurshader = 
var blur_amount = 0

func _process(delta):
	blur_amount = wrapf(blur_amount + 0.05, 0.0, 5.0)
	blur.material.set_shader_param("blur_amount", blur_amount)
