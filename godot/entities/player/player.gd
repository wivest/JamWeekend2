class_name Player
extends RigidBody2D

@export var rifle: Rifle


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			fire()


func fire() -> void:
	if rifle.bullets == 0:
		return

	var bullet: Bullet = rifle.shoot()

	var direction: Vector2 = get_local_mouse_position().normalized()
	var impulse: float = bullet.mass * rifle.shooting_speed
	apply_central_impulse(impulse * -direction)


func ammunition_entered(bullets: int) -> void:
	rifle.bullets += bullets
