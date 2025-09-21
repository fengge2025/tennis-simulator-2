class_name PlayerStateWait extends PlayerState

@onready var player_state_run: PlayerStateRun = $"../PlayerStateRun"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var waiting = false

func enter() -> void:
	print("player enter wait")
	player.update_animation("wait")
	var wait_sec = randf_range(1.0, 2.0)
	wait_timer(wait_sec)
	waiting = true

func exit() -> void:
	waiting = false
	
func wait_timer(wait_sec: float) -> void:
	await get_tree().create_timer(wait_sec).timeout
	waiting = false
