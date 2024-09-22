extends Label


func _ready() -> void:
	Manager.score_changed.connect(_on_score_changed)


func _on_score_changed(bullets: int) -> void:
	var highscore: int = Manager.load_highscore()
	text = "Score: %s Best: %s" % [bullets, highscore]
