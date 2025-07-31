extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if $"../../Monster".goToMonsterDoor==true:
		if $"../../Monster".goingUp==true:
			$"../../Monster".goToMonsterDoor=false
			$"../../Monster".global_position.x=-1162.0
			$"../../Monster".global_position.y=-15
			$"../../Monster".floor-=1
		else:
			$"../../Monster".goToMonsterDoor=false
			$"../../Monster".global_position.x=-1872.0
			$"../../Monster".global_position.y=359-15
			$"../../Monster".floor-=1
