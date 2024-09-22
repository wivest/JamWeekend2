class_name Player
extends RigidBody2D

@export var rifle: Rifle
@export var primary_mass: float = 10

var last_bullet: bool = false


func _ready() -> void:
	$Animation.play("default")
	mass = primary_mass + rifle.get_mass()
	Manager.bullets = rifle.bullets
	Manager.score = 0


func _process(_delta: float) -> void:
	$Animation.flip_h = not get_local_mouse_position().x > 0

	if position.y > get_viewport_rect().size.y / 2:
		die()
	if rifle.bullets == 0 and not last_bullet and linear_velocity.length() < 0.01:
		die()

	if last_bullet and linear_velocity.length() < 0.01:
		var timer: SceneTreeTimer = get_tree().create_timer(0.5)
		timer.timeout.connect(func(): last_bullet = not linear_velocity.length() < 0.01)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			fire()


func fire() -> void:
	if rifle.bullets == 0:
		return

	if rifle.bullets == 1:
		last_bullet = true
	var bullet: Bullet = rifle.shoot()
	mass = primary_mass + rifle.get_mass()

	var direction: Vector2 = get_local_mouse_position().normalized()
	var impulse: float = bullet.mass * rifle.shooting_speed
	apply_central_impulse(impulse * -direction)


func ammunition_entered(bullets: int) -> void:
	rifle.bullets += bullets
	mass = primary_mass + rifle.get_mass()
	Manager.score += 1


func die() -> void:
	get_tree().reload_current_scene()
