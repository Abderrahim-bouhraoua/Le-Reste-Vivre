extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

	
func _on_btn_back_pressed() -> void:
	var anim_player = $ColorRect/AnimationPlayer
	$ColorRect.show()
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")


func _on_btn_jouer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
