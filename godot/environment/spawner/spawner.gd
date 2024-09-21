class_name Spawner
extends Area2D

@export var ammunition_scene: PackedScene
@export var on_start: int = 1

@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var rect: RectangleShape2D = $CollisionShape2D.shape


func _process(_delta: float):
	while on_start > 0:
		spawn()
		on_start -= 1
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 2 and event.pressed:
			spawn()


func spawn() -> void:
	var ammunition: Ammunition = ammunition_scene.instantiate() as Ammunition
	ammunition.collected.connect(_on_ammunition_collected)
	ammunition.global_position = random_point()
	owner.add_child(ammunition)
	

func random_point() -> Vector2:
	var size: Vector2 = rect.size
	var x: float = randf() * size.x
	var y: float = randf() * size.y
	return collider.global_position + Vector2(x, y) - size / 2


func _on_ammunition_collected() -> void:
	call_deferred("spawn")
