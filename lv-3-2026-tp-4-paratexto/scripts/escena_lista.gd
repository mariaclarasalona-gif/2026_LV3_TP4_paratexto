extends Control

@export var container_objetos : Control

var arreglo_objetos = []

func _ready():
	arreglo_objetos = cargar_objetos()

func tachar_texto(cual):
	var texto_original = arreglo_objetos[cual].text
	arreglo_objetos[cual].text = str("[s]",texto_original,"[/s]")

#IMPORTANTE
#Los textos dentro del container tienen que estar en EL MISMO ORDEN que sus
#objetos correspondientes en escena_in_game y tener EL MISMO NOMBRE DE NODO
func cargar_objetos() -> Array:
	var arreglo_de_objetos = []
	
	for child in container_objetos.get_children():
		arreglo_de_objetos.append(child)
	
	return arreglo_de_objetos
