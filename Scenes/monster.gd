class_name Monster
extends CharacterBody2D
@onready var state_machine: Node2D = $StateMachine
var flipped=false
var canMove=false
var floor=1
var goToMonsterDoor=false
var goingUp=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if canMove:
		state_machine.process_physics(delta)

func goLeft() -> void:
	velocity.x=-56
	
	if !flipped:
		flipped=true
		scale.x=-1

func goRight() -> void:
	velocity.x=56
	if flipped:
		flipped=false
		scale.x=-1

func BeginTheMonster() -> void:
	$Timer.start()
	$".".visible=true
	state_machine.init()
	$StateMachine/Roaming.player=$"../Player"
	$StateMachine/Chase.player=$"../Player"
	canMove=true
	$Timer.start()
