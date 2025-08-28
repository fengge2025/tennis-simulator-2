class_name BallStateMachine extends StateMachine

func initialize(ball: Ball) -> void:
	states = []
	for c in get_children():
		if c is State:
			c.ball = ball
			states.append(c)
			
	if states.size() > 0:
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT
