extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			$Sprite2D.hide()
			$CollisionShape2D.disabled = true
			$PointLight2D.hide()
			GlobalVar.has_lg = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
