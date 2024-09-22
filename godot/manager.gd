extends Node

const SAVE_PATH: String = "user://highscore.tres"

signal bullets_changed(bullets: int)
signal score_changed(score: int)

var bullets: int = 0:
	set(v):
		bullets = v
		bullets_changed.emit(v)
var score: int = 0:
	set(v):
		if v > load_highscore():
			save_highscore(v)
		score = v
		score_changed.emit(v)


func _input(event) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			get_tree().quit()


func load_highscore() -> int:
	var resource: HighScore = ResourceLoader.load(Manager.SAVE_PATH) as HighScore
	return resource.score


func save_highscore(new_score: int) -> void:
	var highscore := HighScore.new()
	highscore.score = new_score
	ResourceSaver.save(highscore, SAVE_PATH)
