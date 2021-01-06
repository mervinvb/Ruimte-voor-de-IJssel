extends Panel

var item = preload("res://Item.tscn")
var item_add

func _ready():
	item_add = item.instance()
	add_child(item_add)
