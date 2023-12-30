class_name Pal
extends CharacterBody2D

@export var Has_player = true
@export var MovementData : PlayerMovementData
@export var here = position
@export var guide : RayCast2D

# Do I need to reference gravity?
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var player = get_parent()
@onready var state_machine = $StateMachine

func _physics_process(delta):
	apply_gravity(delta)
	animate()
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += (gravity * MovementData.gravity_scale) * delta

func animate():
	print(state_machine.current_state)
	if state_machine.current_state:
		$AnimatedSprite2D.play("atk")
	elif state_machine.current_state == ("idle"):
		$AnimatedSprite2D.play("idle")
	


