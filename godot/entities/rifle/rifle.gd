class_name Rifle
extends Node2D

@export var bullet_scene: PackedScene
@export var shooting_speed: float = 300

@onready var muzzle: Marker2D = $Muzzle


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())


func shoot() -> Bullet:
	var bullet: Bullet = bullet_scene.instantiate() as Bullet

	bullet.transform = muzzle.global_transform
	bullet.speed = shooting_speed
	owner.add_child(bullet)

	return bullet
