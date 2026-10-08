extends Control

@export var container_objetos : Control
@export var lista : Control

var arreglo_objetos = []
var objetos_encontrados = 0

func _ready():
	arreglo_objetos = cargar_objetos()

func _process(delta):
	if objetos_encontrados >= arreglo_objetos.size():
		await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file("res://escenas/escena_outro.tscn")

func cargar_objetos():
	var arreglo_de_objetos = []
	
	for child in container_objetos.get_children():
		arreglo_de_objetos.append(child)
	
	return arreglo_de_objetos

func encontro_objeto(numero):
	objetos_encontrados += 1
	lista.tachar_texto(numero)
