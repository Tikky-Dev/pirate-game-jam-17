extends State
@export
var ChaseState : State
var player
var patrollingRight=true

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	$"../..".velocity.x = 0
	animSprite.play("walking")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	
	#Patrolling
	if !monster.goToMonsterDoor:
		if patrollingRight:
			monster.goRight()
		if monster.floor==1:
			if monster.global_position.x<-2125:
				patrollingRight=true
				monster.goRight()
			if monster.global_position.x>-370:
				patrollingRight=false
				monster.goLeft()
			
			
		
		if monster.floor==2:
			if monster.global_position.x<-2484:
				patrollingRight=true
				monster.goRight()
			if monster.global_position.x>-237:
				patrollingRight=false
				monster.goLeft()
			
			
		if monster.floor==3:
			if monster.position.x<-2254:
				patrollingRight=true
				monster.goRight()
			if monster.position.x>-209:
				patrollingRight=false
				monster.goLeft()
		
		if monster.floor==4:
			if monster.position.x<-2254:
				patrollingRight=true
				monster.goRight()
			if monster.position.x>-2140:
				patrollingRight=false
				monster.goLeft()
	
	#moving to door
	if monster.goToMonsterDoor:
		if monster.floor == 1:
			if monster.global_position.x < -860:
				monster.goRight()
			elif monster.global_position.x > -800:
				monster.goLeft()
			else:
				print("TRUE")
			
			if monster.global_position.x < -860 && monster.global_position.x > -800:
				print("TRUE")
				monster.position.x=-1162
				monster.position.y=-98
			
		if monster.floor == 2:
			if monster.position.x - 10 < -1162:
				monster.goRight()
			elif monster.position.x + 10 > -1162:
				monster.goLeft()

		if monster.floor == 3:
			if monster.position.x - 10 < -849:
				monster.goRight()
			elif monster.position.x + 10 > -849:
				monster.goLeft()

		if monster.floor == 4:
			if monster.position.x - 10 < -849:
				monster.goRight()
			elif monster.position.x + 10 > -849:
				monster.goLeft()
	
	monster.move_and_slide()
	
	if Ray.get_collider()!=null:
		if Ray.get_collider().get_child(0).name=="DOOR":
			Ray.get_collider().monsterOpensDoor()
	return null

func timerEvent() -> State:
	print("HELLO")
	var randChance=randf_range(0,1)
	
	#Moving Up
	if player.global_position.y < monster.global_position.y - 50:
		if randChance < 0.2:
			monster.goToMonsterDoor=true
			monster.goingUp=true
		
	#Moving Down
	print(player.global_position.y, " ", monster.global_position.y+90)
	if  player.global_position.y > monster.global_position.y+90:
		if randChance < 1:
			monster.goToMonsterDoor=true
			monster.goingUp=false
			
			
	#Find Vents in next zone
		pass
	
	#Patrolling
	#if player.global_position.y > monster.global_position.y-50 && player.global_position.y < monster.global_position.y +70:
		
		
	
	#Confirms that this is stuck on a door
	
		
	
	return null
