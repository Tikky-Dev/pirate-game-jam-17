extends Area2D

var can_interact = false



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Drop"):
		$Sprite2D.show()
		$CollisionShape2D.disabled = false
	if can_interact:
		if event.is_action_pressed("Interact"):
			GlobalVar.has_tool = true
			$Sprite2D.hide()
			$CollisionShape2D.disabled = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
