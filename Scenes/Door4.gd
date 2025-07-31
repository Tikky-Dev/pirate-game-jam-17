extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if $"../../Monster".goToMonsterDoor==true:
			$"../../Monster".goToMonsterDoor=false
			$"../../Monster".global_position.x=-849.0
			$"../../Monster".global_position.y=181-15
			$"../../Monster".floor-=1
