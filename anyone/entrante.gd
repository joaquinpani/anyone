extends Area2D
@export var text1: String

# Called when the node enters the scene tree for the first time.

func _on_body_entered(body: Node2D) -> void:
	
	$"../CanvasLayer2/Label2".text = text1
	queue_free()
	pass # Replace with function body.
