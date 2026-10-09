extends Control

@export var animator_texto : AnimationPlayer
@export var texto : RichTextLabel

var arreglo_lineas_texto_intro = [
	"Ayudame a encontrar las cosas que hicieron que El Gato confiara en mi..",
]

var arreglo_lineas_texto_outro = [
	"En estos barrios...",
	"estar afilado suele acortar la salud.",
	"Continua leyendo para saber en quién no deberías confiar."
]

var termino_animacion = false
var arreglo_texto_actual
var linea_texto_actual = 0

func _ready():
	if name == "escena_intro":
		arreglo_texto_actual = arreglo_lineas_texto_intro
	else:
		arreglo_texto_actual = arreglo_lineas_texto_outro

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if termino_animacion == false:
			animator_texto.active = false
			texto.visible_ratio = 1
			termino_animacion = true
		
		else:
			linea_texto_actual +=1
			if linea_texto_actual >= (arreglo_texto_actual.size()):
				if name == "escena_intro":
					get_tree().change_scene_to_file("res://escenas/escena_in_game.tscn")
				else:
					get_tree().change_scene_to_file("res://escenas/escena_intro.tscn")
			else:
				termino_animacion = false
				animator_texto.active = true
		
		print("click en pantalla")

func _process(delta):
	if termino_animacion == false:
		animacion_texto(arreglo_texto_actual[linea_texto_actual])

func animacion_texto(que_dice):
	termino_animacion = false
	texto.visible_ratio = 0
	texto.text = que_dice
	animator_texto.play("texto_aparece")
	await animator_texto.animation_finished
	termino_animacion = true
