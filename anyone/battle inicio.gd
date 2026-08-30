extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"../Camera2D2".make_current()
		$"../malote/AnimatedSprite2D".play("default")
		$"../malote/ataques".play("aparicion")
		$"../SonicanDramaticMusicEpicCinematicFinale479018".play()
		$".".queue_free()
		
	pass # Replace with function body.
