extends Node2D

# Position du cadre pour le premier profil natif
var cadre_x_startPos : int = 157
var cadre_y_startPos : int = 106

var espacement_x : int = 360

@onready var cadre = $CadreSelection
@onready var lblDescDiff = $lblDescDifficulte

# Défaut natif
var profil_selectionne: int = GameManager.profil_difficulte.NATIF
var tween_cadre : Tween

var dic_description_difficulte = {
	0: """Filet de sécurité solide, ressources stables et marge d'erreur confortable. Idéal pour découvrir les mécaniques et suivre l'histoire sans pression financiere immédiate.""",

	1: """Équilibre fragile entre budget serré, imprévus du quotidien et fatigue. Expérience standard ou chaque choix d'allocation de temps ou d'argent compte.""",

	2: """Situation précaire des le départ, ressources minimes et marge d'erreur quasi nulle. Exige une optimisation constante face aux imprévus et aux crises."""
}

func mettre_a_jour_texte_selon_dif() -> void:
	lblDescDiff.text = dic_description_difficulte[get_difficulte_selectionnee()]

func _ready() -> void:
	mettre_a_jour_texte_selon_dif()
	cadre.position = Vector2(cadre_x_startPos, cadre_y_startPos)

func selectionner_profil(nouveau_profil: int) -> void:
	profil_selectionne = nouveau_profil
	
	# Natif 0, Résident 1, Mobilité 2
	var index = int(profil_selectionne)
	var cible_x = cadre_x_startPos + (index * espacement_x)
	var pos_cible = Vector2(cible_x, cadre_y_startPos)

	if tween_cadre:
		tween_cadre.kill()
	
	tween_cadre = create_tween()
	tween_cadre.tween_property(cadre, "position", pos_cible, 0.15)\
		.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		
	#mise a jour texte
	mettre_a_jour_texte_selon_dif()

func get_difficulte_selectionnee() -> int:
	return profil_selectionne

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right") and profil_selectionne < GameManager.profil_difficulte.MOBILITE:
		selectionner_profil(profil_selectionne + 1)
	elif event.is_action_pressed("ui_left") and profil_selectionne > GameManager.profil_difficulte.NATIF:
		selectionner_profil(profil_selectionne - 1)

func _on_btn_jouer_pressed() -> void:
	GameManager.initialiser_partie(profil_selectionne)
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_btn_back_pressed() -> void:
	var anim_player = $ColorRect/AnimationPlayer
	$ColorRect.show()
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
