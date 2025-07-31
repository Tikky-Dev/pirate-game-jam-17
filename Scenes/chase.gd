extends State

var player
var attacking=false
var CanDealDamage=true

func process_physics(delta: float) -> State:
	
	if monster.global_position.x<player.global_position.x-40:
		monster.goRight()
		monster.velocity.x+=20
	elif monster.global_position.x > player.global_position.x+40:
		monster.goLeft()
		monster.velocity.x-=20
	
	if monster.global_position.x<player.global_position.x+80 && monster.global_position.x > player.global_position.x-80:
		animSprite.play("attack")
		monster.velocity.x=0
		attacking=true
		
	
	
	else:
		animSprite.play("walking")
		attacking=false
	
	if animSprite.frame==8 && attacking && CanDealDamage:
		CanDealDamage=false
		player.health-=1
		if player.health<=0:
			player.Die()
			
	if player.visible==false:
		return $"../Roaming"
	monster.move_and_slide()
	return null
func enter() -> void:
	
	pass


func _on_timer_attack_delay_timeout() -> void:
	CanDealDamage=true
	pass # Replace with function body.
