class_name Bullet
extends Area2D

const LIMIT: float = 10000

@export var mass: float = 5

var speed: float


func _process(delta: float) -> void:
	position += transform.x * speed * delta

	if global_position.length() > LIMIT:
		queue_free()
