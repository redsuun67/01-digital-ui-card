extends Control

@export var HpFlowContainer: HBoxContainer 
@export var TimeLabel: Label
@export var LvLabel: Label
@export var NameLabel: Label
@export var HpLabel: Label
@export var HovLabel: Label
@export var BagLabel: Label
@export var WgLabel: Label
var heart_icon = preload('res://assets/ASSET_PACK/heart.png') 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Вывод информации на карточку 
	update_info() 
	# Подсчет и вывод сердец 
	update_hearts(int(Global.hp)) 
	# Время 
	update_time()

func update_info(): 
	# Расчет уровня
	if int(Global.hp) > 9 && int(Global.hov) > 5: 
		LvLabel.text = '5' 
	else: 
		LvLabel.text = '1' 
	 
	# Добавление информации в Label  
	NameLabel.text = str(Global.name_user)
	# Расчет уровня
	if int(Global.hp) > 9 && int(Global.hov) > 5: 
		LvLabel.text = '5' 
	else: 
		LvLabel.text = '1' 
	 
	NameLabel.text = str(Global.name_user)
	HpLabel.text = str(Global.hp)
	HovLabel.text = str(Global.hov)
	BagLabel.text = str(Global.bag)
	WgLabel.text = str(Global.wg)
func update_hearts(hp_value: int):
	# Очищаем контейнер - на всякий случай
	for child in HpFlowContainer.get_children():
		child.queue_free()
	# Считаем количество сердец
	var count = floor(hp_value / 2)
	# Создание текстур в виде сердца
	for i in range(count):
		var rect = TextureRect.new()
		rect.texture = heart_icon
		rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		rect.custom_minimum_size = Vector2(16, 16)
		HpFlowContainer.add_child(rect)
func update_time():
	var t = Time.get_time_dict_from_system()
	TimeLabel.text = '%02d:%02d' % [t.hour, t.minute]

# Сигнал от Timer
func _on_timer_timeout():
	update_time()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
