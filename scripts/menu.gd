extends Control

func _ready() -> void:
	$VBoxContainer/start.pressed.connect(start)
	$VBoxContainer2/end.pressed.connect(end)
	
func start() -> void:
	get_tree().change_scene_to_file("res://scenes/b4mount.tscn")
	
func end() -> void:
	get_tree().quit()
