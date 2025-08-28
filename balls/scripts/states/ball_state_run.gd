class_name BallStateRun extends BallState

@onready var ball_state_wait: Node = $"../BallStateWait"

var moving: bool = false
var target_position: Vector2 = Vector2(100, 100)
var speed: float = 200.0

func enter() -> void:
	ball.update_animation("run")
	moving = true
	
func exit() -> void:
	moving = false

func process(delta: float) -> State:
	if moving:
		var direction = (target_position - ball.position).normalized()
		var distance = ball.position.distance_to(target_position)

		if distance > speed * delta:
			ball.position += direction * speed * delta
		else:
			ball.position = target_position
			moving = false
		return null
	else:
		return ball_state_wait
