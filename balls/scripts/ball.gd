class_name Ball extends Node2D

@export_category("territory")
@export var territory_x_min: float = 0
@export var territory_x_max: float = 0
@export var territory_y_min: float = 0
@export var territory_y_max: float = 0

@onready var ball_state_machine: BallStateMachine = $BallStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	ball_state_machine.initialize(self)

func _process(_delta: float) -> void:
	pass

func update_animation( animation: String) -> void:
	animation_player.play(animation)

func desire_position() -> Vector2:
	var rand_vec = Vector2(
		randf_range(territory_x_min, territory_x_max),
		randf_range(territory_y_min, territory_y_max)
	)
	
	return rand_vec
