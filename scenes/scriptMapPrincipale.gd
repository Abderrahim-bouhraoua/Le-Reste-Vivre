extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("RESET")
	await get_tree().create_timer(0.1).timeout
	$fade_transition/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
