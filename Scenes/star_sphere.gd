extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(self, "rotation", TAU, 360).from(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
