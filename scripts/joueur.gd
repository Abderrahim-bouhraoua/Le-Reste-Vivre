class_name Joueur extends CharacterBody2D


var vitesse_mouvement : float = 200.0

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D


#on precharge les 3 animations des eleves
var frames_natif = preload("res://assets/spritesheets/joueur/frames_natif.tres")
var frames_resident = preload("res://assets/spritesheets/joueur/frames_resident.tres")
var frames_mobilite = preload("res://assets/spritesheets/joueur/frames_mobilite.tres")

var derniere_direction : String = "haut"

func _ready():
	#executé au demarrage
	#on changera la texture de leleve en fonction de la difficulté

	match GameManager.profil_choisi:
		
		GameManager.profil_difficulte.NATIF:
			anim.sprite_frames = frames_natif
			
		GameManager.profil_difficulte.RESIDENT:
			anim.sprite_frames = frames_resident
		
		GameManager.profil_difficulte.MOBILITE:
			anim.sprite_frames = frames_mobilite
			
	
func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2.ZERO
	
	direction.x = Input.get_action_strength("bouger_droite") - Input.get_action_strength("bouger_gauche")
	direction.y = Input.get_action_strength("bouger_bas") - Input.get_action_strength("bouger_haut")
	
	#regler la vitesse de la diagonale
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * vitesse_mouvement
		gerer_animation_marche(direction)
	else:
		velocity = Vector2.ZERO
		anim.play("statique_" + derniere_direction)
	
	move_and_slide()

func gerer_animation_marche(dir: Vector2) -> void:
	
	# Priorité à l'axe avec le mouvement le plus fort
	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			derniere_direction = "droite"
		else:
			derniere_direction = "gauche"
	else:
		if dir.y > 0:
			derniere_direction = "bas"
		else:
			derniere_direction = "haut"
			
	anim.play("marche_" + derniere_direction)
