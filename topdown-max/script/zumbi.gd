extends CharacterBody2D

@export  var jogador : CharacterBody2D
var SPEED = 300.0
var direcao = Vector2.ZERO

func _physics_process(delta: float) -> void:
	mover()
	move_and_slide()
func mover():
	if jogador:
		direcao = (jogador.global_position - global_position).normalized()
	
	velocity = direcao * SPEED
	
	
