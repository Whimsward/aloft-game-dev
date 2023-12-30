extends StaticBody2D

@onready var collider = $CollisionPolygon2D
@onready var visual = $CollisionPolygon2D/Polygon2D

func _ready():
	visual.polygon = collider.polygon
