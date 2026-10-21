extends Node2D


var score: int = 0
@export var objectsc: PackedScene
@export var objectsc2: PackedScene
@export var objectsc3: PackedScene
@export var starttext: DialogueResource
@export var starttexttitle: String = "start"
func ouch() -> void:
	print("end")

func _ready():
	DialogueManager.show_dialogue_balloon(starttext, starttexttitle)
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)

func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	get_tree().change_scene_to_file("res://scenes/mount.tscn")
func _on_score_timer_timeout():
	score += 10
	print(score)
	
func _on_object_timer_timeout():
	var obtype: int = randf_range(1,4)
	var object = objectsc.instantiate()
	if obtype == 1:
		print("1")
		object = objectsc.instantiate()
	elif obtype == 2:
		print("2")
		object = objectsc2.instantiate()
	elif obtype == 3:
		print("3")
		object = objectsc3.instantiate()
	
	
	var obpos = $Path2D/PathFollow2D
	obpos.progress_ratio = randf()
	
	object.position = obpos.position
	
	var obdir = obpos.rotation
	object.rotation = obdir
	
	object.linear_velocity = Vector2(0, -660)
	
	add_child(object)
