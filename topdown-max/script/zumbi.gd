extends CharacterBody2D
@export var vida:= 18
@export  var jogador : CharacterBody2D
@onready var barra_de_vida := $ProgressBar
var SPEED = 300.0
var direcao = Vector2.ZERO
func _ready() -> void:
	barra_de_vida.max_value = vida
	barra_de_vida.value = vida
func _physics_process(delta: float) -> void:
	mover()
	rotacionar_corpo()
	move_and_slide()
func mover():
	if jogador:
		direcao = (jogador.global_position - global_position).normalized()
	
	velocity = direcao * SPEED
	
func rotacionar_corpo(): 
		if jogador:
			look_at(jogador.global_position)
func tomar_dano(dano_recebido):
	vida -= dano_recebido
	barra_de_vida.value = vida
	if vida <= 0 :
		self.queue_free()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.tomar_dano()
