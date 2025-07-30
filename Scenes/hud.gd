extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Health.text = "Health: " + str(GlobalVar.health)
	$Scraps.text = "Scraps: " + str(GlobalVar.scraps)
	$Metal.text = "Metal: " + str(GlobalVar.metal)
	$Organics.text = "Organics: " + str(GlobalVar.organics)
