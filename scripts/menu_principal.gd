extends Node2D


enum boutonMenu {
	AUCUN,
	JOUER,
	OPTIONS,
	QUITTER
}
var type_bouton: boutonMenu = boutonMenu.AUCUN
var en_transition: bool = false  # pour pas cliquer plusieurs fois


func _ready() -> void:
	$Fade_transition/fade_timer.wait_time = 0.5
	$Fade_transition/fade_timer.one_shot = true
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func lancer_transition(bouton: boutonMenu) -> void:
	if en_transition:
		return
	en_transition = true
	type_bouton = bouton
	$ButtonManager.mouse_filter = Control.MOUSE_FILTER_STOP
	$Fade_transition/AnimationPlayer.play("fade_in")
	$Fade_transition/fade_timer.start()


func _on_jouer_pressed() -> void:
	lancer_transition(boutonMenu.JOUER)


func _on_options_pressed() -> void:
	lancer_transition(boutonMenu.OPTIONS)


func _on_quitter_pressed() -> void:
	lancer_transition(boutonMenu.QUITTER)


func _on_fade_timer_timeout() -> void:
	match type_bouton:
		boutonMenu.JOUER:
			get_tree().change_scene_to_file("res://scenes/main.tscn")

		boutonMenu.OPTIONS:
			en_transition = false
			$ButtonManager.mouse_filter = Control.MOUSE_FILTER_IGNORE
			$Fade_transition/AnimationPlayer.play("fade_out")
			get_tree().change_scene_to_file("res://scenes/menu_options.tscn")
			
		boutonMenu.QUITTER:
			get_tree().quit()

		boutonMenu.AUCUN:
			en_transition = false
