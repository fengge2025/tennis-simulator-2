class_name PlayerStateRun extends PlayerState

@onready var player_state_hit: PlayerStateHit = $"../PlayerStateHit"

var moving: bool = false
var speed: float = 200.0

func enter() -> void:
	print("player enter run")
	player.update_animation("run")
	moving = true
	
func exit() -> void:
	moving = false

func process(delta: float) -> State:
	if moving:
		var direction = (player.target_position - player.position).normalized()
		var distance = player.position.distance_to(player.target_position)

		if distance > speed * delta:
			player.position += direction * speed * delta
		else:
			player.position = player.target_position
			moving = false
		return null
	else:
		return player_state_hit
