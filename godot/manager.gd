extends Node

signal bullets_changed(bullets: int)
signal score_changed(score: int)

var bullets: int = 0:
	set(v):
		bullets = v
		bullets_changed.emit(v)
var score: int = 0:
	set(v):
		score = v
		score_changed.emit(v)
