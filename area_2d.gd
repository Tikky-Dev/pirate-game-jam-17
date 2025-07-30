extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if GlobalVar.rightElevatorRepaired:
			if event.is_action_pressed("upElevator"):
				if $"../Player".global_position.y > -105:
					print("Moved up")
					$"../Player".global_position.y -= 180
			if event.is_action_pressed("downElevator"):
				if $"../Player".global_position.y < 255:
					print("Moved down")
					$"../Player".global_position.y += 180
		elif GlobalVar.rightElevatorRepaired == false:
			if GlobalVar.has_tool:
				if event.is_action_pressed("Interact"):
					GlobalVar.rightElevatorRepaired = true
					GlobalVar.metal -= 2

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$Up.visible = true
	$Down.visible = true
	$PointLight2D.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Up.visible = false
	$Down.visible = false
	$PointLight2D.visible = false
