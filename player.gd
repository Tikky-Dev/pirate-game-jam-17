extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
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
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		if is_walking == true:
			pass
		elif is_walking == false:
			$AnimatedSprite2D.play("Walking")
			is_walking = true
		$AnimatedSprite2D.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("Idle")
		is_walking = false

	move_and_slide()
