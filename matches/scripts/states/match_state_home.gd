class_name MatchStateHome extends MatchState

@onready var match_state_away: MatchStateAway = $"../MatchStateAway"

func enter() -> void:
	print("match enter home")
	match_hit_enter(player_home, player_away)

func process(_delta: float) -> State:
	if processing:
		return null
	return match_state_away

func exit() -> void:
	match_hit_exit(player_home, player_away)
