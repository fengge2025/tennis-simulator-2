class_name MatchStateMachine extends StateMachine

func initialize(player_home: Player, player_away: Player, ball: Ball) -> void:
	states = []
	for c in get_children():
		if c is MatchState:
			c.player_home = player_home
			c.player_away = player_away
			c.ball = ball
			states.append(c)
			
	if states.size() > 0:
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT
