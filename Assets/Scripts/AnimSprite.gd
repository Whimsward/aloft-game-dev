extends Sprite2D

@export var player : Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.velocity.x < 0:
		flip_h = true
	if player.velocity.x > 0:
		flip_h = false

