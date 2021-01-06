extends Button

onready var KlikHier = get_tree().root.get_node("Node2D/Credits")

func _on_Button_pressed():
	SceneChanger.changescene("res://Credits.tscn")

func _on_Button_mouse_exited():
	KlikHier.set("custom_colors/font_color",Color(0,0,0))


func _on_Button_mouse_entered():
	KlikHier.set("custom_colors/font_color",Color(0.12,0.49,0.72))
