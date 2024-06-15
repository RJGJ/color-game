extends Node

signal game_state_changed(state)

enum GameState {
	IDLE,
	PLAYING,
	REROLL,
	RESULT
}

func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass
