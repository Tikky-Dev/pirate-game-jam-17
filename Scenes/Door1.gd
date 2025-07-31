extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	if $"../../Monster".goToMonsterDoor==true:
		print("MONSTER DETECTED FOR GOING OUT")
		
		
		$"../../Monster".global_position.x=-1162.0
		$"../../Monster".global_position.y=0
		$"../../Monster".goToMonsterDoor=false
		$"../../Monster".floor+=1
	pass # Replace with function body.
