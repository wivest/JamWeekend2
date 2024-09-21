class_name Bullet
extends Area2D

@export var mass: float = 1

var speed: float


func _process(delta: float) -> void:
	position += transform.x * speed * delta
