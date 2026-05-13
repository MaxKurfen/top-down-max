extends CharacterBody2D

const SPEED = 300.0
var direcao = Vector2.ZERO

@onready var  ponta_arma = $pontadaarma
@onready var som_tiro = $som_tiro
@export var bala_cena: PackedScene 

#fisica 
func _physics_process(delta: float) -> void:
	move_and_slide()
	mover()
	rotacionar_corpo()
#movimentacao do player
func mover():
	direcao = Input.get_vector("andar_esquerda", "andar_direira", "andar_cima", "andar_baixo")
	velocity = direcao * SPEED

#funcao de atirar
func _input (event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()
		 
func disparar():
	var nova_bala = bala_cena.instantiate()
	nova_bala.global_position = ponta_arma.global_position
	nova_bala.direcao = (ponta_arma.global_position - global_position).normalized() 
	nova_bala.rotation = rotation 
	get_tree().current_scene.add_child(nova_bala)
	#som do tiro
	som_tiro.play()
	

	#mover com o mause
func rotacionar_corpo():
	look_at(get_global_mouse_position())
