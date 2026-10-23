extends Control
const high_score = "user://hscore.save"
var highscore = 0
var oldname = ""
var oldname2 = ""

func _ready() -> void:
	var file := FileAccess.open(high_score, FileAccess.READ)
	if file:
		highscore = file.get_var()
		oldname = file.get_var()
		oldname2 = file.get_var()
	$Label2.text = str(highscore, "\n set by \n", oldname)
	$VBoxContainer/start.pressed.connect(start)
	$VBoxContainer/Button2.pressed.connect(start2)
	$VBoxContainer2/end.pressed.connect(end)
	
func start() -> void:
	get_tree().change_scene_to_file("res://scenes/b4mount.tscn")
	
func start2() -> void:
	get_tree().change_scene_to_file("res://scenes/mountendless.tscn")
	
func end() -> void:
	get_tree().quit()
