class_name Match extends Node2D

@onready var match_state_machine: MatchStateMachine = $MatchStateMachine
@onready var ball: Ball = $Ball
@onready var player_home: Player = $PlayerHome
@onready var player_away: Player = $PlayerAway


func _ready() -> void:
	match_state_machine.initialize(player_home, player_away, ball)
