extends CharacterBody2D

signal attacking
signal walking
signal jumping

@onready var target = $IdlePalTarget

@export_category("Player")
@export var movement_data : PlayerMovementData
@export var atk_data : AttackData

@export_category("Pals")
@export var Has_Pal = true
@export var pal_select : PackedScene
var pal = pal_select



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	var direction = Input.get_axis("Left", "Right")
	handle_acceleration(direction,delta)
	move_and_slide()

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
		walking.emit()
		velocity.x = move_toward(velocity.x, movement_data.speed * direction, movement_data.acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x,0,movement_data.friction * delta)


func player_attack():
	if Input.is_action_just_pressed("Attack"):
		attacking.emit()	

