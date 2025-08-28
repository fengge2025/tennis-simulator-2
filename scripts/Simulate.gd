extends Node2D

@onready var start_button = $StartButton

var heads_count = 0
var tails_count = 0
const MAX_TOSSES = 500
const MAX_BAR_WIDTH = 500  # Pixels

func _ready():
	start_button.pressed.connect(_on_start_button_pressed)
	
func _on_start_button_pressed():
	heads_count = 0
	tails_count = 0
	_update_bars()
	start_button.disabled = true
	await _roll_coins(MAX_TOSSES)
	start_button.disabled = false

func _roll_coins(times: int) -> void:
	for i in range(times):
		var result = randi() % 2
		if result == 0:
			heads_count += 1
		else:
			tails_count += 1

		_update_bars()
		await get_tree().create_timer(0.01).timeout

func _update_bars():
	pass
