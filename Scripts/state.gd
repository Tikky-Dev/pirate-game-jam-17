class_name State extends Node

@export
var animation_name: String
@export var animSprite : AnimatedSprite2D
@export var monster : Monster
@export var Ray : RayCast2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter() -> void:
	animSprite.play("idle")

func exit() -> void:
	pass


func process_physics(delta: float) -> State:
	return null
	

func timerEvent() -> State:
	return null
