extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Health.text = "Health: " + str(GlobalVar.health)
	$Scraps.text = "Scraps: " + str(GlobalVar.scraps)
	$Metal.text = "Metal: " + str(GlobalVar.metal)
	$Organics.text = "Organics: " + str(GlobalVar.organics)

#func _input(event: InputEvent) -> void:
	#if GlobalVar.using_lg:
	#	if event.is_action_pressed("useTool"):
	#		$Broken.visible = true
	#		$Broken/PointLight2D.visible = true
	#		$Timer.start(0.5)

func _on_timer_timeout() -> void:
	$Broken.visible = false
	$Broken/PointLight2D.visible = false
