extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if (GlobalVar.has_tool == true and GlobalVar.metal == 20):
			if event.is_action_pressed("Interact"):
				GlobalVar.engineRepaired = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
