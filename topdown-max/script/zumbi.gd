extends CharacterBody2D

@export  var jogador : CharacterBody2D
var SPEED = 300.0
var direcao = Vector2.ZERO

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
			
func tomar_dano():
	self.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.tomar_dano()
