extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if GlobalVar.engineRepaired:
		get_tree().change_scene_to_file("res://Scenes/ending.tscn")
