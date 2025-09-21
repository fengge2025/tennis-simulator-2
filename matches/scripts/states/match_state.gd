class_name MatchState extends State

var player_home: Player
var player_away: Player
var ball: Ball

var processing = false
var desire_ball_position: Vector2 = Vector2.ZERO


func match_hit_enter(player_hit: Player, player_receive: Player) -> void:
	processing = true
	player_hit.player_state_machine.player_state_hit.hit_finished.connect(handle_hit_finished)
	player_hit.player_state_machine.change_to_run()
	player_receive.player_state_machine.change_to_wait()
	ball.ball_state_machine.change_to_run()

func match_hit_exit(player_hit: Player, player_receive: Player) -> void:
	player_hit.player_state_machine.player_state_hit.hit_finished.disconnect(handle_hit_finished)
	player_receive.target_position = desire_ball_position
	ball.target_position = desire_ball_position
	processing = false
	
func handle_hit_finished(_desire_ball_position: Vector2) -> void:
	desire_ball_position = _desire_ball_position
	processing = false
