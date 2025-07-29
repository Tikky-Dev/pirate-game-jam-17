extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("upElevator"):
			print("Moved Up")
		if event.is_action_pressed("downElevator"):
			print("Moved Down")

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$Up.visible = true
	$Down.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Up.visible = false
	$Down.visible = false
