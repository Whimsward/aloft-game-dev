class_name CharacterMovementData
extends Resource

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var cb2 : CharacterBody2D

@export_category("Speed")
@export var speed : float = 100
@export var jump_velocity : float = -300
@export var acceleration : float = 600
@export var friction : float = 1000

@export_category("Gravity")
@export var has_gravity = true
@export var gravity_scale : float = 1

func apply_gravity(delta):
	cb2.velocity.y += gravity * delta 
