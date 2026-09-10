extends Node

@export var Hp: TextEdit
@export var Hov: TextEdit
@export var Bag: TextEdit
@export var Wg: TextEdit
@export var Name_user: TextEdit
@export var NextScene: PackedScene 
# Called when the node enters the scene tree for the first time.
func _on_next_button_pressed() -> void: 
	Global.set_info(Hp.text, Hov.text, Bag.text, Wg.text, Name_user.text) 
	get_tree().change_scene_to_file("res://scenes/67.tscn")
func _ready() -> void:
	pass # Replace with function body..
func _process(delta: float) -> void:
	pass
