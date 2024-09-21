extends Label


func _ready() -> void:
	Manager.bullets_changed.connect(_on_bullets_changed)


func _on_bullets_changed(bullets: int) -> void:
	text = "Ammo: %s" % bullets
