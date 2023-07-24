extends StaticBody3D
#boy oh boy, I hope you like export variables.

@export var Sprite:Texture
@export var timeline:DialogicTimeline
@export var FMODEvent:int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite3D.texture = Sprite # Apply sprite
	$AnimatedSprite3D.play()

