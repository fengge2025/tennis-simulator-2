class_name Player extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine

func _ready() -> void:
	player_state_machine.initialize(self)

func _process(delta: float) -> void:
	pass

func update_animation( animation: String) -> void:
	animation_player.play(animation)
