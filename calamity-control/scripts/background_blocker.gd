extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.mouse_filter = Control.MOUSE_FILTER_STOP
	print("BackgroundBlocker is active!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
