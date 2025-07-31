extends CharacterBody2D


var SPEED = 100.0
var JUMP_VELOCITY = -200.0
var is_walking := false
var has_hg := false #hg = handgun
var has_pg := false #pg = plasmagun
var using_flashlight := true
var using_hg := false
var using_pg := false

var canMove=true

var health=3

func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if canMove:
			
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
			$Sprite2D.flip_h = false
			$Sprite2D.position = Vector2(-9, 0)
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
			$Sprite2D.flip_h = true
			$Sprite2D.position = Vector2(11, 0)
			$ArmPosition.scale.x=-1
			
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if $ArmPosition.scale.x==1:
				$ArmPosition.position.x=0
				$ArmPosition.position.y=8
			elif $ArmPosition.scale.x==-1:
				$ArmPosition.position.x=0
				$ArmPosition.position.y=8
			
			
			$AnimatedSprite2D.play("Idle")
			is_walking = false
			
		move_and_slide()
	GlobalVar.player_position = $".".global_position
	

func _input(event: InputEvent) -> void:
	if GlobalVar.has_tool == true:
		if event.is_action_pressed("Interact"):
			using_flashlight = false
			using_hg = false
			GlobalVar.using_lg = false
			using_pg = false
			SPEED = 50
			JUMP_VELOCITY = -100
			$ArmPosition/ArmPivot/ArmSprite.frame = 2
			$Sprite2D.visible = true
		elif event.is_action_pressed("Drop"):
			using_flashlight = true
			using_hg = false
			GlobalVar.using_lg = false
			using_pg = false
			SPEED = 100
			JUMP_VELOCITY = -200
			$ArmPosition/ArmPivot/ArmSprite.frame = 0
			$Sprite2D.visible = false
			GlobalVar.has_tool = false
	else:
		SPEED = 100
		JUMP_VELOCITY = -200
		$Sprite2D.visible = false
		if event.is_action_pressed("Lasergun"):
			if GlobalVar.has_lg:
				using_flashlight = false
				using_hg = false
				GlobalVar.using_lg = true
				using_pg = false
				$ArmPosition/ArmPivot/ArmSprite.frame = 1
		elif event.is_action_pressed("Flashlight"):
			using_flashlight = true
			using_hg = false
			GlobalVar.using_lg = false
			using_pg = false
			$ArmPosition/ArmPivot/ArmSprite.frame = 0

func Die() -> void:
	$AnimatedSprite2D.play("Death")
	canMove=false
