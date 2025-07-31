extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			if (GlobalVar.has_tool == true and GlobalVar.metal >= 20):
				$RepairSound.play(0.5)
				$RepairVoice.play()
				GlobalVar.engineRepaired = true
				GlobalVar.metal -= 20
				print("engine")

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$Label2.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Label2.visible = false
