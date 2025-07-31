extends Area2D

var can_interact = false

func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			if (GlobalVar.health < 2 and GlobalVar.organics >= 2):
				$HealingSound.play()
				$HealingVoice.play()
				GlobalVar.health += 1
				GlobalVar.organics -= 2
			print(GlobalVar.health)
			print(GlobalVar.organics)

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$Label.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Label.visible = false
