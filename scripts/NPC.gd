extends StaticBody3D
#boy oh boy, I hope you like export variables.

@export var timeline:DialogicTimeline
@export var FMODEvent:int

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite3D.play()

