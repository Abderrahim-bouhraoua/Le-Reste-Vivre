extends Node2D

var type_bouton = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jouer_pressed() -> void:
	type_bouton = "jouer"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")
	

func _on_options_pressed() -> void:
	type_bouton = "options"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_quitter_pressed() -> void:
	type_bouton = "quitter"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	if button_type == "jouer" :
		get_tree().change_scene_to_file("res://scenes/main.tscn")
		
	elif button_type == "options" :
		pass
	elif button_type == "quitter"
