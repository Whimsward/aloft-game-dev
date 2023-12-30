extends AnimationPlayer

@export var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_idle()


func _on_test_animation_player_jumping():
	play("idlejump")


func _on_test_animation_player_walking():
	play("idlewalk")


func player_idle():
	if not player.velocity:
		play("idlestill")


func _on_test_animation_player_attacked():
	print("Attacking")
	if player.is_on_floor():
		if player.velocity:
			play("attackwalk")
		else:
			play("attackstill")
	else: play("attackjump")
