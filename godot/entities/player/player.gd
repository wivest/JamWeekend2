class_name Player
extends RigidBody2D

@export var rifle: Rifle
@export var primary_mass: float = 10


func _ready() -> void:
	mass = primary_mass + rifle.get_mass()
	Manager.bullets = rifle.bullets
	Manager.score = 0


func _process(_delta: float) -> void:
	if position.y > get_viewport_rect().size.y / 2:
		die()
	if rifle.bullets == 0 and linear_velocity == Vector2.ZERO:
		die()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			fire()


func fire() -> void:
	if rifle.bullets == 0:
		return

	var bullet: Bullet = rifle.shoot()
	mass = primary_mass + rifle.get_mass()

	var direction: Vector2 = get_local_mouse_position().normalized()
	var impulse: float = bullet.mass * rifle.shooting_speed * rifle.power_multiplier
	apply_central_impulse(impulse * -direction)


func ammunition_entered(bullets: int) -> void:
	rifle.bullets += bullets
	mass = primary_mass + rifle.get_mass()
	Manager.score += 1


func die() -> void:
	get_tree().reload_current_scene()
