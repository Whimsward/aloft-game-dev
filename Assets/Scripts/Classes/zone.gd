class_name Zone
extends Node

@export var player: CharacterBody2D

@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D

#@onready var stats = $Controls_Layer/VBoxContainer/MoveStats
#@onready var pal = $GameObjects/Aloft_Alt/wind_sprite

func _ready():
	RenderingServer.set_default_clear_color(Color.AQUA)
	polygon_2d.polygon = collision_polygon_2d.polygon


func _physics_process(_delta):
	#stats.text = ("Pal: State: ")+str($"GameObjects/Aloft_Alt/wind_sprite/StateMachine".current_state.name)+(". Velocity: ")+str(pal.velocity)+(". Target: ")+str($GameObjects/Aloft_Alt/IdlePalTarget.global_position)+(". Position: ")+str(pal.global_position)+(". Vel Length: ")+str(pal.velocity.length())+(". In Idle Zone?")+str($GameObjects/Aloft_Alt/IdlePalTarget/IdleZone.overlaps_body(pal))
	
	pass

