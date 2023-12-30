class_name Player
extends CharacterBody2D

signal attacked
signal walking
signal jumping

@export var movement_data : PlayerMovementData
@export var atk_data : AttackData
@export var Has_Pal = false
@export var attacking : bool

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	var direction = Input.get_axis("Left", "Right")
	handle_acceleration(direction,delta)
	move_and_slide()
	player_attack()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		jumping.emit()
		
func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = movement_data.jump_velocity
	else:
		if Input.is_action_just_released("Jump") and velocity.y < movement_data.jump_velocity / 2:
			velocity.y = movement_data.jump_velocity / 2

func handle_acceleration(direction,delta):
	if direction != 0:
		velocity.x = move_toward(velocity.x, movement_data.speed * direction, movement_data.acceleration * delta)
		if is_on_floor():
			walking.emit()
	else:
		velocity.x = move_toward(velocity.x,0,movement_data.friction * delta)
		
func player_attack():
	if Input.is_action_pressed("Attack"):
		attacking = true
		attacked.emit()
		
