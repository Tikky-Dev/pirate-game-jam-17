extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			if GlobalVar.scraps > 0:
				$Scrap.play(0.5)
				GlobalVar.scraps -= 1
				GlobalVar.metal += 1



func _on_body_entered(body: Node2D) -> void:
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
