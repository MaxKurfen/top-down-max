extends Node2D
@onready var pontos_spawn = $SpawnPoints
@onready var jogador = $Jogador
var cena_inimigo := preload("res://scenes/zumbi.tscn")
func spawn_simples():
	var spawn_escolhido = pontos_spawn.get_children() .pick_random()
	var novo_inimigo = cena_inimigo.instantiate()
	novo_inimigo.global_position = spawn_escolhido.global_position
	novo_inimigo.jogador = jogador 
	get_tree().current_scene.add_child(novo_inimigo)
func _on_timer_timeout() -> void:
	spawn_simples()
