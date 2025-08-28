class_name MatchStateHome extends MatchState

@onready var match_state_away: MatchStateAway = $"../MatchStateAway"

var processing = false

func enter() -> void:
	print("match enter home")
	processing = true
	player_away.player_state_machine.player_state_hit.hit_finished.connect(handle_hit_finished)
	player_away.player_state_machine.change_to_run()
	player_home.player_state_machine.change_to_wait()

func process(_delta: float) -> State:
	if processing:
		return null
	return match_state_away

func exit() -> void:
	player_away.player_state_machine.player_state_hit.hit_finished.disconnect(handle_hit_finished)
	processing = false
	
func handle_hit_finished() -> void:
	processing = false
