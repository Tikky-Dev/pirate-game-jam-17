extends Area2D

var can_interact = false
var is_open = false
var is_hidden = false

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if can_interact:
		if event.is_action_pressed("Interact"):
			if is_open:
				if is_hidden:
					print("Shown")
					$AnimatedSprite2D.frame = 1
					is_hidden = false
					$"../Player".visible=true
					$"../Player".canMove=true
					$HideLight.visible=false
				elif not is_hidden:
					print("Hidden")
					$"../Player".visible=false
					$"../Player".canMove=false
					$HideLight.visible=true
					
					$AnimatedSprite2D.frame = 2
					is_hidden = true
			elif not is_open:
				var selection = randf()
				print(selection)
				if selection < .5:
					GlobalVar.scraps += 1
					print("Scraps" + str(GlobalVar.scraps))
				elif selection < .75:
					GlobalVar.organics += 1
					print("Organics" + str(GlobalVar.organics))
				elif selection < 1:
					GlobalVar.metal += 1
					print("Metal" + str(GlobalVar.metal))
				$AnimatedSprite2D.frame = 1
				is_open = true

func _on_body_entered(body: Node2D) -> void:
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	can_interact = false
