extends Node2D
class_name StatBar

var bar_rect: TextureRect
var bar_label: Label
#@onready var abc = $TextureRect
func _ready():
	bar_rect = TextureRect.new()
	bar_rect.texture = preload("res://assets/barCharts/barChartBlue.png")
	bar_rect.position = Vector2(-400, -150)
	bar_rect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT
	bar_rect.stretch_mode = TextureRect.STRETCH_SCALE
	bar_rect.size.y = 40
	add_child(bar_rect)
	
	bar_label = Label.new()
	bar_label.position = Vector2(-400, -250)
	bar_label.text = "testste"
	var font = FontFile.new()
	font.load("res://assets/fonts/Jersey15-Regular.ttf")
	bar_label.add_theme_font_override("font", font)
	bar_label.size = Vector2(50,50)
	add_child(bar_label)

#func set_texture(path: String) -> void:
	#bar_rect.texture = preload(path)
	
func set_label(l: String):
	bar_label.text = l

func set_length(x: float) -> void:
	bar_rect.size.x = x
	#abc.size.x = x
