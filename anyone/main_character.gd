extends CharacterBody2D
var vida = 3
var muerto = false
const SPEED = 450.0
const JUMP_VELOCITY = -700.0
var atacando = false
var a = false
var power = false
func _physics_process(delta: float) -> void:
		# Add the gravity.
		
	if atacando == false:
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$FreesoundCommunityToyButton105725.play()
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		
		if direction:
			if $U3x9Ga8WevjWalkingSoundEffect272246.playing == true:
				if  not is_on_floor() and $FreesoundCommunityWind144149.playing == false:
						$FreesoundCommunityWind144149.play()
						$U3x9Ga8WevjWalkingSoundEffect272246.stop()
				pass
			else:
				if is_on_floor():
					$U3x9Ga8WevjWalkingSoundEffect272246.play()
					$FreesoundCommunityWind144149.stop()
				else:
					if $FreesoundCommunityWind144149.playing == false:
						$FreesoundCommunityWind144149.play()
			velocity.x = direction * SPEED
			if is_on_floor():
				$AnimatedSprite2D.play("right")
			if velocity.x > 0:
				$AnimatedSprite2D.flip_h = false
				
			elif velocity.x < 0:
				$AnimatedSprite2D.flip_h = true
				
			
			
				
				
		else:
			if is_on_floor():
				$U3x9Ga8WevjWalkingSoundEffect272246.stop()
			$AnimatedSprite2D.play("default")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if not is_on_floor():
			velocity += get_gravity() * delta
			$AnimatedSprite2D.play("jump")
		
		if Input.is_action_just_pressed("ataque") and is_on_floor():
			if power == false:
				atacando = true
				$AnimationPlayer.play("ataque")
				$BiwwShortElectricZap561890.play()
				if $AnimatedSprite2D.flip_h == false:
					$Area2D.scale.x = 1
					$AnimatedSprite2D.flip_h = false
				elif $AnimatedSprite2D.flip_h == true:
					$AnimatedSprite2D.flip_h = true
					$Area2D.scale.x = -1
		if Input.is_action_just_pressed("q"):
			power = true
		move_and_slide()

func finalataque():
	
	
	atacando = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not area.is_in_group("ala"):
		area.atacado()
	pass # Replace with function body.
	
func dañado():
	if vida > 1:
		$UniversfieldPunchImpactHit567196.play()
		$vida.show()
		atacando = true
		$AnimatedSprite2D.play("damaged")
		$Timer.start()
		$Timer2.start()
		if vida == 2:
			$vida/Sprite2D2.hide()
		if vida == 3:
			$vida/Sprite2D3.hide()
		vida = vida -1
	else:
		$DataPionSfx28Attack338386.play()
		atacando = true
		$ColorRect/AnimationPlayer.play("gameover")
		$AnimatedSprite2D.play("deafeted")
		$vida/Sprite2D.hide()

func _on_timer_timeout() -> void:
	atacando = false
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	$vida.hide()
	pass # Replace with function body.


func _on_daño_body_entered(body: Node2D) -> void:
	if a == true:
		position = $"../PinJoint2D".position
		dañado()
	pass # Replace with function body.


func _on_ala_timeout() -> void:
	a = true
	pass # Replace with function body.


func _on_portal_body_entered(body: Node2D) -> void:
	$"../CanvasLayer/ColorRect".show()
	get_tree().change_scene_to_file("res://finale.tscn")
	pass # Replace with function body.

func reinicio():
	get_tree().change_scene_to_file("res://escenario.tscn")
	
func batallainicio():
	$"../malote/Timer".start()
	$"../malote/ataques".play("balas",1.0)
	atacando = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		atacando = true
		
	pass # Replace with function body.
