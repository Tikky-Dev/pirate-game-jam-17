extends Node2D


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world_testing.tscn")
	GlobalVar.has_tool
	GlobalVar.health
	GlobalVar.leftElevatorRepaired
	GlobalVar.metal
	GlobalVar.organics
	GlobalVar.oxygen
	GlobalVar.rightElevatorRepaired
	GlobalVar.scraps
