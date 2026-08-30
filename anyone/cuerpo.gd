
	
	
	
extends Area2D
var vida = 5



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.dañado()
	pass # Replace with function body.

func atacado():
	$"../AnimatedSprite2D".play("hit")
	$PhatphrogstudioRpgFemaleAttackGruntNoAi481720.play()
	vida = vida -1
	if vida == 0:
		get_tree().change_scene_to_file("res://credits.tscn")
		pass
	
