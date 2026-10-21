extends CharacterBody2D

@export var speed = 600
var ded = 0
var input = 0
signal end

func get_input():
	var direction = Input.get_axis("left", "right")
	
	velocity.x = direction*speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()

	if ded == 0:
		if position.y == 345.0:
			pass
		else:
			#ded screen animation etc
			ded = 1
			$AnimatedSprite2D.play("fall")
			input = 1
			await get_tree().create_timer(1.0).timeout
			end.emit()
			input = 0
			
			print("ded")
	
	if input == 0:
		if Input.is_action_pressed("left"):
			print("left")
			$AnimatedSprite2D.play("left_lean")
		if Input.is_action_pressed("jump"):
			
			$AnimatedSprite2D.play("jump")
			$AnimationPlayer.play("jump")
			$Sprite2D.show()
			#$CollisionShape2D.set_deferred("disabled", true)
			set_collision_mask_value(1, false)
			input = 1
			await get_tree().create_timer(1.0).timeout
			input = 0
			$Sprite2D.hide()
			set_collision_mask_value(1, true)
			$AnimatedSprite2D.play("straight")
			
		if Input.is_action_pressed("right"):
			print("right")
			$AnimatedSprite2D.play("right_lean")
		if Input.is_action_just_released("right"):
			print("rightgone")
			$AnimatedSprite2D.play("straight")
		if Input.is_action_just_released("left"):
			print("lefhtgone")
			$AnimatedSprite2D.play("straight")
	
			
			
	

	
