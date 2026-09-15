extends Node2D



enum boutonMenu {
	AUCUN,
	JOUER,
	OPTIONS,
	QUITTER
}
var type_bouton: boutonMenu = boutonMenu.AUCUN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jouer_pressed() -> void:
	type_bouton = boutonMenu.JOUER
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")
	

func _on_options_pressed() -> void:
	type_bouton = boutonMenu.OPTIONS
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_quitter_pressed() -> void:
	type_bouton = boutonMenu.QUITTER
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	match type_bouton:
		boutonMenu.JOUER:
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		
		boutonMenu.OPTIONS:
			pass
		boutonMenu.QUITTER:
			get_tree().quit()
			
		boutonMenu.AUCUN:
			pass
