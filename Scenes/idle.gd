extends State

var doneIdling=false
# Called when the node enters the scene tree for the first time.
func process_physics(delta: float) -> State:
	animSprite.play("idle")
	monster.velocity.x=0
	if doneIdling==true:
		return $"../Roaming"
	return null
	


func _on_idle_timer_timeout() -> void:
	doneIdling=true
	pass # Replace with function body.
