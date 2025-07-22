extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var is_walking := false

func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	
	if direction > 0:
		if is_walking == true:
			pass
		elif is_walking == false:
			$AnimatedSprite2D.play("Walking")
			is_walking = true
			$ArmPosition.position.x=0
			$ArmPosition.position.y=8
		$AnimatedSprite2D.flip_h = false
		$ArmPosition.scale.x=1
	elif direction < 0:
		if is_walking == true:
			pass
		elif is_walking == false:
			$AnimatedSprite2D.play("Walking")
			is_walking = true
			$ArmPosition.position.x=0
			$ArmPosition.position.y=7
		$AnimatedSprite2D.flip_h = true
		$ArmPosition.scale.x=-1
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if $ArmPosition.scale.x==1:
			$ArmPosition.position.x=-9
			$ArmPosition.position.y=1
		elif $ArmPosition.scale.x==-1:
			$ArmPosition.position.x=9
			$ArmPosition.position.y=1
		
		
		$AnimatedSprite2D.play("Idle")
		is_walking = false
		
	move_and_slide()
