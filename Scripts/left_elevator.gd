extends Area2D

var can_interact = false

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if can_interact:
		if GlobalVar.leftElevatorRepaired:
			if event.is_action_pressed("upElevator"):
				if $"../Player".global_position.y > -105:
					$Sound.play(4)
					$"../Player".global_position.y -= 180
			if event.is_action_pressed("downElevator"):
				if $"../Player".global_position.y < 76:
					$Sound.play(4)
					$"../Player".global_position.y += 180
		elif GlobalVar.leftElevatorRepaired == false:
			if GlobalVar.has_tool:
				if event.is_action_pressed("Interact"):
					$RepairSound.play(0.5)
					$RepairVoice.play()
					GlobalVar.leftElevatorRepaired = true
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
