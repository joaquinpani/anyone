extends Area2D
var vida = 3



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.dañado()
	pass # Replace with function body.
