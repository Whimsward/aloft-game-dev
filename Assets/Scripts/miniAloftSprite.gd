extends AnimatedSprite2D

@export var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	player_idle()
	attack()


func attack():
	if Input.is_action_pressed("Attack"):
		if player.is_on_floor():
			if player.velocity:
				play("Atk_Walk")
				await animation_finished
			else: 
				play("Atk_Still")
				await animation_finished
		else: 
			play("Atk_Lev")
			await animation_finished

func _on_aloft_alt_attacking():
	if player.is_on_floor():
		if player.velocity:
			play("Atk_Walk")
		else: play("Atk_Still")
	else: play("Atk_Lev")


func _on_aloft_alt_jumping():
	play("Lev")


func _on_aloft_alt_walking():
	play("Walk")


func player_idle():
	if not player.velocity:
		play("Idle")
	if player.velocity.x < 0:
		flip_h = true
	if player.velocity.x > 0:
		flip_h = false
