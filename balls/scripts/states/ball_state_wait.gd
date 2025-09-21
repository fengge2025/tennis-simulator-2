class_name BallStateWait extends BallState

@onready var ball_state_run: Node = $"../BallStateRun"

var waiting = false

func enter() -> void:
	print("ball enter wait")
	waiting = true

func exit() -> void:
	waiting = false
