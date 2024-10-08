class_name Rifle
extends Node2D

@export var bullet_scene: PackedScene
@export var shooting_speed: float = 2000
@export var bullets: int = 3:
	set(v):
		bullets = v
		Manager.bullets = v

@onready var muzzle: Marker2D = $Muzzle


func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position() - global_position
	$Sprite2D.flip_v = not mouse_position.x > 0
	look_at(get_global_mouse_position())


func shoot() -> Bullet:
	bullets -= 1
	var bullet: Bullet = bullet_scene.instantiate() as Bullet

	bullet.transform = muzzle.global_transform
	bullet.speed = shooting_speed
	owner.add_child(bullet)

	return bullet


func get_mass() -> float:
	var bullet: Bullet = bullet_scene.instantiate() as Bullet
	return bullets * bullet.mass
