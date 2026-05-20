extends Area2D
var velocidade = 300
var direcao = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocidade * direcao * delta
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigos"):
		body.tomar_dano()
