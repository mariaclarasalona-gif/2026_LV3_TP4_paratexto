extends Control

@export var animator_texto : AnimationPlayer
@export var texto : RichTextLabel

var arreglo_lineas_texto = [
	"esta es la parte 0 del texto",
	"esta es la parte 1",
	"y así sucesivamente"
]

var termino_animacion = false
var linea_texto_actual = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if termino_animacion == false:
			animator_texto.active = false
			texto.visible_ratio = 1
			termino_animacion = true
		else:
			linea_texto_actual += 1
			termino_animacion = false
			animator_texto.active = true
		
		print("click en pantalla")

func _process(delta):
	if termino_animacion == false:
		animacion_texto(arreglo_lineas_texto[linea_texto_actual])

func animacion_texto(que_dice):
	termino_animacion = false
	texto.visible_ratio = 0
	texto.text = que_dice
	animator_texto.play("texto_aparece")
	await animator_texto.animation_finished
	termino_animacion = true
