extends StudioBankLoader

@export var bank_asset: BankAsset
@export var event_asset: EventAsset
var bank: Bank

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		RuntimeManager.play_one_shot(event_asset)
