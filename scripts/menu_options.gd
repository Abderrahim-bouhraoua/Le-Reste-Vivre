extends Node2D

@onready var btn_back: TextureButton = $btnBack
@onready var slide_son: HSlider = $slideSon
@onready var slide_musique: HSlider = $slideMusique

var bus_musique_index: int
var bus_sfx_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_musique_index = AudioServer.get_bus_index("Musique")
	bus_sfx_index = AudioServer.get_bus_index("SFX")
	
	slide_musique.value = db_to_linear(AudioServer.get_bus_volume_db(bus_musique_index))
	slide_son.value = db_to_linear(AudioServer.get_bus_volume_db(bus_sfx_index))
	
	slide_musique.value_changed.connect(_on_slide_musique_changed)
	slide_son.value_changed.connect(_on_slide_son_changed)
	btn_back.pressed.connect(_on_btn_back_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_slide_musique_changed(valeur: float) -> void:
	AudioServer.set_bus_volume_db(bus_musique_index, linear_to_db(valeur))
	AudioServer.set_bus_mute(bus_musique_index, valeur == 0)

func _on_slide_son_changed(valeur: float) -> void:
	AudioServer.set_bus_volume_db(bus_sfx_index, linear_to_db(valeur))
	AudioServer.set_bus_mute(bus_sfx_index, valeur == 0)

func _on_btn_back_pressed() -> void:
	var anim_player = $ColorRect/AnimationPlayer
	$ColorRect.show()
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
