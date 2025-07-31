extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if $"../../Monster".goToMonsterDoor==true:
		if $"../../Monster".goingUp==true:
			$"../../Monster".goToMonsterDoor=false
			$"../../Monster".global_position.x=-833.0
			$"../../Monster".global_position.y=-179-15
			$"../../Monster".floor-=1
		else:
			$"../../Monster".goToMonsterDoor=false
			$"../../Monster".global_position.x=-849.0
			$"../../Monster".global_position.y=-181-15
			$"../../Monster".floor-=1
		
		
		
