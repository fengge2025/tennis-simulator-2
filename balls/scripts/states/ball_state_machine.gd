class_name BallStateMachine extends StateMachine

@onready var ball_state_wait: BallStateWait = $BallStateWait
@onready var ball_state_run: BallStateRun = $BallStateRun

func initialize(ball: Ball) -> void:
	states = []
	for c in get_children():
		if c is State:
			c.ball = ball
			states.append(c)
			
	if states.size() > 0:
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT

func change_to_run() -> void:
	change_state(ball_state_run)
	
func change_to_wait() -> void:
	change_state(ball_state_wait)