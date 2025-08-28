class_name BallStateWait extends BallState

@onready var ball_state_run: Node = $"../BallStateRun"

var waiting = false

func enter() -> void:
	var wait_sec = 0.1
	wait_timer(wait_sec)
	waiting = true

func exit() -> void:
	waiting = false
	
func process(_delta: float) -> State:
	if waiting:
		return null
		
	var desire_position = ball.desire_position()
	
	ball_state_run.target_position = desire_position
	return ball_state_run
	
func wait_timer(wait_sec: float) -> void:
	await get_tree().create_timer(wait_sec).timeout
	waiting = false
