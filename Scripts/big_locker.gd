extends Area2D

var can_interact = false
var is_open = false
var is_hidden = false

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			$Interact.play(2.3)
			if is_open:
				if is_hidden:
					print("Shown")
					$AnimatedSprite2D.frame = 1
					is_hidden = false
					$"../Player".visible=true
					$"../Player".canMove=true
					$HideLight.visible=false
					$Label2.text = "Interact to hide"
					$Label2.visible = true
					if GlobalVar.has_tool:
						$Label.visible = true
					$LeaveVoice.play()
				elif not is_hidden:
					print("Hidden")
					$"../Player".visible=false
					$"../Player".canMove=false
					$HideLight.visible=true
					
					$AnimatedSprite2D.frame = 2
					$Label.visible = false
					$label2.visible = false
					is_hidden = true
					$HideVoice.play()
			elif not is_open:
				var selection = randf()
				print(selection)
				if selection < .5:
					GlobalVar.scraps += 1
					print("Scraps" + str(GlobalVar.scraps))
				if (selection > .5 and selection < .75):
					GlobalVar.organics += 1
					print("Organics" + str(GlobalVar.organics))
				if (selection > .75 and selection < 1):
					GlobalVar.metal += 1
					print("Metal" + str(GlobalVar.metal))
				$AnimatedSprite2D.frame = 1
				is_open = true
				$OpenVoice.play()
		if event.is_action_pressed("useTool"):
			if GlobalVar.has_tool:
				if is_open:
					$Breakdown.play(0.5)
					GlobalVar.scraps += 2
					$".".visible = false
					$CollisionShape2D.disabled = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true
	if is_open:
		$Label2.text = "Interact to hide"
		$Label2.visible = true
		if GlobalVar.has_tool:
			$Label.visible = true
	if !is_open:
		$Label2.text = "Interact to open"
		$Label2.visible = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
	$Label.visible = false
	$Label2.visible = false
