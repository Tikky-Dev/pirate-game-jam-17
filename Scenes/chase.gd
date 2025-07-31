extends State

var player



func process_physics(delta: float) -> State:
	print(monster.global_position.x-player.global_position.x)
	if monster.global_position.x<player.global_position.x-40:
		monster.goRight()
		monster.velocity.x+=10
	elif monster.global_position.x > player.global_position.x+40:
		monster.goLeft()
		monster.velocity.x-=10
	
	if monster.global_position.x<player.global_position.x+80 && monster.global_position.x > player.global_position.x-80:
		animSprite.play("attack")
		monster.velocity.x=0
	else:
		animSprite.play("walking")
	
	monster.move_and_slide()
	return null
func enter() -> void:
	
	pass
