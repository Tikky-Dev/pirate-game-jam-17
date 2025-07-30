extends Node2D


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/opening.tscn")
	GlobalVar.has_tool = false
	GlobalVar.health = 2
	GlobalVar.leftElevatorRepaired = false
	GlobalVar.metal = 0
	GlobalVar.organics = 0
	GlobalVar.oxygen = 20
	GlobalVar.rightElevatorRepaired = false
	GlobalVar.scraps = 0
	GlobalVar.engineRepaired = false
