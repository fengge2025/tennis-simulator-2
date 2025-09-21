class_name PlayerStateHit extends PlayerState

signal hit_finished(desire_ball_position: Vector2)

@onready var player_state_run: PlayerStateRun = $"../PlayerStateRun"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player_state_wait: PlayerStateWait = $"../PlayerStateWait"

var hitting: bool = false

func enter() -> void:
	print("player enter hit")
	player.update_animation("hit")
	animation_player.play("hit")
	animation_player.animation_finished.connect(end_hit)
	
	hitting = true
	
func exit() -> void:
	animation_player.animation_finished.disconnect(end_hit)
	hitting = false

func process(_delta: float) -> State:
	if hitting:
		return null
	return player_state_wait

func end_hit(_animation: String) -> void:
	hitting = false
	hit_finished.emit(player.hit_desire_position())
