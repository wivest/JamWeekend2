class_name Ammunition
extends Area2D

signal collected

@export var bullets: int = 5


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.ammunition_entered(bullets)
		collected.emit()
		queue_free()
