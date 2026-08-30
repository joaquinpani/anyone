extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DiamondTunesSonicSymposiumLogo203256.play()
	$AnimationPlayer.play("new_animation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://escenario.tscn")
	pass # Replace with function body.
