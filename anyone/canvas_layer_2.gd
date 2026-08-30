extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AbsolutesoundSuspenseTenseAtmosphere514617.play()
	$Label/AnimationPlayer.play("new_animation")
	pass # Replace with function body.

func musica():
	$AbsolutesoundSuspenseTenseAtmosphere514617.stop()
	$Label/FreesoundCommunityDesertShimmer24684.play()
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
