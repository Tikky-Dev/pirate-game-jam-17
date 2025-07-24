extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".scale.x==1:
		if global_position.angle_to_point(get_global_mouse_position())< 3.14*0.30 && position.angle_to_point(get_global_mouse_position())>-3.14*0.30:
			look_at(get_global_mouse_position())
	else:
		if global_position.angle_to_point(get_global_mouse_position())> 3.14*0.8 || position.angle_to_point(get_global_mouse_position())< -0.8*3.14:
			look_at(get_global_mouse_position())
		
	rotation_degrees 
	pass
