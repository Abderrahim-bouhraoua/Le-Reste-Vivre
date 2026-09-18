extends Node
#fichier pour gerer toutes les statistiques du joueur
#est chargé en autoload singleton durant toute la durée du jeu
#pour que rien ne soit détruit

enum profil_difficulte  { NATIF, RESIDENT, MOBILITE, AUCUN }

var profil_choisi = profil_difficulte.AUCUN
var argent : float = 0
var sante : float = 0
var sante_mentale : float = 0
var education : float = 0
var stress : float = 0

func initialiser_partie(profil : profil_difficulte) -> void:
	profil_choisi = profil
	
	#ca se transorme en int mais vzy cest bon ya 0 1 ou 2
	print("difficulté choisie : ", str(profil_choisi))
	
	#Ici on reglera les stats en fonction du profil
	#
	match profil:
		profil_difficulte.NATIF:
			pass
		profil_difficulte.RESIDENT:
			pass
		profil_difficulte.MOBILITE:
			pass
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
