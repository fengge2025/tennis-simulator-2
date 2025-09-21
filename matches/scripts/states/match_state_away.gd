class_name MatchStateAway extends MatchState

@onready var match_state_home: MatchStateHome = $"../MatchStateHome"

func enter() -> void:
	print("match enter away")
	match_hit_enter(player_away, player_home)

func process(_delta: float) -> State:
	if processing:
		return null
	return match_state_home

func exit() -> void:
	match_hit_exit(player_away, player_home)
