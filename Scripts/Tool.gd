extends Area2D

var can_interact = false

var hasNeverPickedUp=true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Drop"):
		if GlobalVar.has_tool:
			$Sprite2D.show()
			$PointLight2D.show()
			$CollisionShape2D.disabled = false
			position.x=$"../Player".position.x
			position.y=$"../Player".position.y + 24
	if can_interact:
		if event.is_action_pressed("Interact"):
			if hasNeverPickedUp:
				$"../Monster".BeginTheMonster()
			GlobalVar.has_tool = true
			$Sprite2D.hide()
			$CollisionShape2D.disabled = true
			$PointLight2D.hide()

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	print(can_interact)

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	print("HELLO")
