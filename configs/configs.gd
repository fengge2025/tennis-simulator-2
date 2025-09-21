extends Node

var configs: Dictionary = {}

func _ready():
	load_config()

func load_config():
	var config_file = ConfigFile.new()
	var err = config_file.load("res://configs/configs.ini")  # your INI file path
	if err != OK:
		print("Failed to load config.ini")
		return
	
	# Read territory values
	var territory_x_min = config_file.get_value("territory", "territory_x_min", 0)
	var territory_x_max = config_file.get_value("territory", "territory_x_max", 0)
	var territory_home_y_min = config_file.get_value("territory", "territory_home_y_min", 0)
	var territory_home_y_max = config_file.get_value("territory", "territory_home_y_max", 0)
	var territory_away_y_min = config_file.get_value("territory", "territory_away_y_min", 0)
	var territory_away_y_max = config_file.get_value("territory", "territory_away_y_max", 0)
	
	var home = {
		"run_x_min": territory_x_min,
		"run_x_max": territory_x_max,
		"run_y_min": territory_home_y_min,
		"run_y_max": territory_home_y_max,
		"hit_x_min": territory_x_min,
		"hit_x_max": territory_x_max,
		"hit_y_min": territory_away_y_min,
		"hit_y_max": territory_away_y_max,
	}
	
	var away = {
		"run_x_min": territory_x_min,
		"run_x_max": territory_x_max,
		"run_y_min": territory_away_y_min,
		"run_y_max": territory_away_y_max,
		"hit_x_min": territory_x_min,
		"hit_x_max": territory_x_max,
		"hit_y_min": territory_home_y_min,
		"hit_y_max": territory_home_y_max,
	}
	
	configs["home"] = home
	configs["away"] = away
