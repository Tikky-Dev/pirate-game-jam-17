extends Area2D

var is_open = false
var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			if is_open:
				while ($Top.position != Vector2(0, 38)):
					$Top.position.y += 1
				$StaticBody2D/ToggleCollision.set_deferred("disabled", false)
				is_open = false
				$DoorOccluder.visible=true
			elif not is_open:
				while ($Top.position != Vector2(0, -42)):
					$Top.position.y -= 1
				$StaticBody2D/ToggleCollision.set_deferred("disabled", true)
				$DoorOccluder.visible=false
				is_open = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true



func _on_body_exited(body: Node2D) -> void:
	can_interact = false
