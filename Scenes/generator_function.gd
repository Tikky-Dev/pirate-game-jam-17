extends Area2D

var can_interact

func _input(event: InputEvent) -> void:
	if can_interact:
		if GlobalVar.using_lg:
			if GlobalVar.usedGun:
				$Charge.play()
				GlobalVar.usedGun = false
		

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	$InteractLabel.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$InteractLabel.visible = false
