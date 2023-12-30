extends CharacterBody2D

@export var MovementData : PlayerMovementData
@export var parent : CharacterBody2D
@onready var follow_point = parent.get_node("ArdorSprite/Target")

func _physics_process(_delta):
	move_and_slide()
#animation definition
#	if velocity.length() > 0:
#		$AnimationPlayer.play("run")
#	else:
#		$AnimationPlayer.play("idle")
	
	
