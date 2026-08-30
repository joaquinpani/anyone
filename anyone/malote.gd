extends Node2D
var bd = preload("res://bala_derecha.tscn")
var bi = preload("res://bala_izquierda.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bala_derecha():
	$RibhavagrawalBulletshotImpactSoundEffect230462.play()
	var instancia = bd.instantiate()
	instancia.global_position = Vector2(2746.0, 374.0)
	add_child(instancia)
	
func izquierda():
	$RibhavagrawalBulletshotImpactSoundEffect230462.play()
	var instancia = bi.instantiate()
	instancia.global_position = Vector2(2515.0, 374.0)
	add_child(instancia)



func anim_atacke() -> void:
	$AnimatedSprite2D.play("atacke")


func anim_correr() -> void:
	$AnimatedSprite2D.play("correr")



func anim_default() -> void:
	$AnimatedSprite2D.play("default")



func anim_effect() -> void:
	$DragonStudioSwordSlice2393845.play()
	$AnimatedSprite2D.play("effect")



func anim_hit() -> void:
	$AnimatedSprite2D.play("hit")



func anim_jump() -> void:
	$JofaeSwingWhoosh110410.play()
	$AnimatedSprite2D.play("jump")


func atackderecha():
	$AnimatedSprite2D/AnimationPlayer.play("ataque")
	
func atackdizq():
	$AnimatedSprite2D/AnimationPlayer.play("ataque izquierda")


func _on_timer_timeout() -> void:
	var a = randi_range(1, 2)
	
	if a == 1:
		$ataques.play("balasmas", 2.0)
	else:
		$ataques.play("balas", 2.0)
