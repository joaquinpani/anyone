extends Area2D
var muerto = false
var vida = 3
func _ready() -> void:
	$"../../portal/AnimatedSprite2D".play("inactivo")
	
	
	$"../AnimatedSprite2D".play("default")
func atacado():
	if muerto == false:
		$"../AnimatedSprite2D".play("daño")
		$"../Timer".start()
	

func _on_timer_timeout() -> void:
	if muerto == false:
		$"../AnimatedSprite2D".play("default")
		if vida == 3:
			$"../Sprite2D".show()
			$"../Sprite2D2".show()
			$"../Sprite2D3".hide()
			vida = vida -1
		elif vida == 2:
			$"../Sprite2D2".hide()
			vida = vida -1
		elif vida == 1:
			muerto = true
			$"../AnimatedSprite2D".play("morir")
			$"../Sprite2D".hide()
			$"../../portal/AnimatedSprite2D".play("activo")
			$"../../portal".monitoring = true
			
		
	pass # Replace with function body.
