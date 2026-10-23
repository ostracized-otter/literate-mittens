extends Node2D

var house = 0
var height: int = 2797
var score: int = 0
var ded = 0
var objectspeed: int = -600
@export var objectsc: PackedScene
@export var objectsc2: PackedScene
@export var objectsc3: PackedScene
@export var objectsc4: PackedScene
@export var objectsc5: PackedScene
@export var objectsc6: PackedScene
@export var objectsc7: PackedScene
@export var objectsc8: PackedScene
@export var objectsc9: PackedScene
@export var objectsc10: PackedScene
@export var objectsc11: PackedScene
@export var objectsc12: PackedScene
@export var objectsc13: PackedScene
@export var objectsc14: PackedScene
@export var objectsc15: PackedScene
@export var objectsc16: PackedScene
@export var objectsc17: PackedScene
@export var objectsc18: PackedScene
@export var objectsc19: PackedScene
@export var objectspecial: PackedScene


func ouch() -> void:
	print("end")
func _ready() -> void:
	$CanvasLayer/Label.text = str(3)
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Label.text = str(2)
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Label.text = str(1)
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Label.text = str(2797)
	$score_timer.start()
	$object_timer.start()
	$Parallax2D2/Sprite2D.texture = load("res://textures/house1.png")
	$Parallax2D.autoscroll = Vector2(0,-600)
	$Parallax2D2.autoscroll = Vector2(0,-600)
	
func _physics_process(delta):
	if house == 0:
		await get_tree().create_timer(6.0).timeout
		$Parallax2D2.hide()
		house = 1
func _on_score_timer_timeout():
	height -= 32
	$CanvasLayer/Label.text = str(height)
	if height <= 2000 and height >= 1000:
		$CanvasLayer/Label.position = Vector2(541, 58)
	if height <= 1000:
		$CanvasLayer/Label.position = Vector2(523, 59)
	if height <= 2000:
		$Parallax2D.autoscroll = Vector2(0,-800)
		objectspeed = -800
		$CanvasLayer/Label4.text = str(5)
	if height <= 1000:
		$Parallax2D.autoscroll = Vector2(0,-1000)
		$CanvasLayer/Label4.text = str(0)
		$CanvasLayer/Label3.text = str(2)
		objectspeed = -1000
	if height <= 100:
		$object_timer.stop()
	if height <= 0:
		height = 0
		$score_timer.stop()
		$CanvasLayer/Label.hide()
		$CanvasLayer/Label3.hide()
		$CanvasLayer/Label4.hide()
		$CanvasLayer/uiback.hide()
		$Parallax2D3.autoscroll = Vector2(0,-600)
		await get_tree().create_timer(4).timeout
		$Parallax2D3.autoscroll = Vector2(0,0)
		$Parallax2D.autoscroll = Vector2(0,0)
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/aftermount.tscn")
		
		
	
func _on_object_timer_timeout():
	var obtype: int = randf_range(1,14)
	var obtyper1: int = randf_range(1,4)
	var obtyper2: int = randf_range(1,4)
	var obtyper3: int = randf_range(1,3)
	var obtyper4: int = randf_range(1,3)
	var obtyper5: int = randf_range(1,3)
	var obtyper6: int = randf_range(1,3)
	var obtyperspec: int = randf_range(1,2000)
	var object = objectsc3.instantiate()
	
	if obtyperspec == 1:
		object = objectspecial.instantiate()
	elif obtype == 1:
		object = objectsc8.instantiate()
	elif obtype == 2:
		object = objectsc3.instantiate()
	elif obtype == 4:
		object = objectsc4.instantiate()
	elif obtype == 5:
		object = objectsc5.instantiate()
	elif obtype == 6:
		object = objectsc6.instantiate()
	elif obtype == 7:
		object = objectsc7.instantiate()
	elif obtype == 8:
		object = objectsc9.instantiate()
	elif obtype == 9:
		object = objectsc10.instantiate()
	elif obtype == 10:
		object = objectsc12.instantiate()
	elif obtype == 11:
		object = objectsc13.instantiate()
	elif obtype == 12:
		object = objectsc18.instantiate()
	#elif obtype == 13:
		#object = objectsc19.instantiate()
	
	
	
	elif obtyper1 == 3 and obtyper2 == 3:
		object = objectsc2.instantiate()
	elif obtyper1 == 2 and obtyper2 == 2:
		object = objectsc.instantiate()
	elif obtyper1 == 1 and obtyper2 == 1:
		object = objectsc11.instantiate()
	elif obtyper3 == 1 and obtyper4 == 1:
		object = objectsc14.instantiate()
	elif obtyper3 == 2 and obtyper4 == 2:
		object = objectsc15.instantiate()
	elif obtyper3 == 1 and obtyper4 == 2:
		object = objectsc16.instantiate()
	elif obtyper3 == 2 and obtyper4 == 1:
		object = objectsc17.instantiate()
		
	elif obtyper5 == 1 and obtyper6 == 1:
		object = objectsc19.instantiate()
	var obpos = $Path2D/PathFollow2D
	obpos.progress_ratio = randf()
	
	object.position = obpos.position
	
	var obdir = randf_range(-0.2,0.2)
	object.rotation = obdir
	

	
	object.linear_velocity = Vector2(0, objectspeed)
	
	add_child(object)
	
func _on_node_2d_end() -> void:
	$score_timer.stop()
	$CanvasLayer/Label.hide()
	$CanvasLayer/Label3.hide()
	$CanvasLayer/Label4.hide()
	$CanvasLayer/uiback.hide()
	$CanvasLayer/TextureRect.show()
	$CanvasLayer/TextureRect/Label.text = str(2797 - height)
	$CanvasLayer/TextureRect/Label.show()
	ded = 1
	
func _process(float) -> void:
		if Input.is_action_pressed("esc"):
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
		if Input.is_action_pressed("jump") and ded == 1:
			get_tree().reload_current_scene()
