extends CanvasLayer
var TempoMaximo = 60
var TempoPassado = 0
@onready var tempo_round = $"tempo do round"
@onready var round_atual = $"round atual"
func _ready() -> void: 
	atualizar_relogio()
	atualizar_round()
func atualizar_round():
	round_atual.text = "round: "+ str(Global.round)
func _on_cronometro_round_timeout() -> void:
	TempoPassado += 1
	atualizar_relogio()
	
func atualizar_relogio():
	var diferenca_tempo = TempoMaximo - TempoPassado
	var tempo_minutos = int(diferenca_tempo/60)
	var tempo_segundos = diferenca_tempo% 60
	
	if tempo_minutos < 10:
		tempo_minutos= "0" +str(tempo_minutos)
	else:
		tempo_minutos = str(tempo_segundos)
	if tempo_segundos < 10:
		tempo_segundos = "0"+str(tempo_segundos)
	else:
		tempo_segundos = str(tempo_segundos)
	tempo_round.text = tempo_minutos+":"+tempo_segundos
	if diferenca_tempo <= 0 :
		fim_do_round()
func fim_do_round():
	Global.round +=1
	get_tree().reload_current_scene()
