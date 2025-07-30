extends Area2D

var can_interact = false

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if can_interact:
		if GlobalVar.leftElevatorRepaired:
			if event.is_action_pressed("upElevator"):
				print("Moved Up")
			if event.is_action_pressed("downElevator"):
				print("Moved Down")
		elif GlobalVar.leftElevatorRepaired == false:
			if GlobalVar.has_tool:
				if event.is_action_pressed("Interact"):
					GlobalVar.leftElevatorRepaired = true
					GlobalVar.metal -= 2



func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$Up.visible = true
	$Down.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Up.visible = false
	$Down.visible = false
