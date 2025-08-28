class_name PlayerStateMachine extends StateMachine

@onready var player_state_wait: PlayerStateWait = $PlayerStateWait
@onready var player_state_hit: PlayerStateHit = $PlayerStateHit
@onready var player_state_run: PlayerStateRun = $PlayerStateRun

func initialize(player: Player) -> void:
	states = []
	for c in get_children():
		if c is State:
			c.player = player
			states.append(c)
			
	if states.size() > 0:
		change_state( player_state_wait )
		process_mode = Node.PROCESS_MODE_INHERIT

func change_to_run() -> void:
	change_state(player_state_run)
	
func change_to_wait() -> void:
	change_state(player_state_wait)
	
func change_to_hit() -> void:
	change_state(player_state_hit)
